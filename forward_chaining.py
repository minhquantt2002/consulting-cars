from typing import List, Any


class Rule:
    def __init__(self, left, right):
        self.left = left
        self.right = right
        self.checked = False
        self.right_checked = False
    def search_missing(self, events: List[str]):  # tìm ra cái thiéu
        for event in self.left:  # lấy từng event trong vế trái
            if event not in events:  # nếu không thuộc list events tổng thì trả về
                return event
        return None  # trả về none khi mà vế trái đủ điều kiện cho vế phải
    
    def __str__(self):
        return ",".join(self.left) + "->" + self.right


"""
Đầu vào:
- Tập list các rules: Rule[]
- Tập list các events: str[]
- Mục tiêu goal: str
Đầu ra: 
- Kết quả result: bool
- List đường đi: str[]
- List các events: str[] 
"""
def forward_chaining(rules: List[Rule], events: List[str], goal: str='') -> (bool, List[str], List[str]):
    road = []
    # khi goal chưa nằm trong events
    total = len(events)
    output = ""
    it = 0
    while 1:
        rule_applied = False
        it += 1
        output += f"Lặp lần {it}: \n"
        for rule in rules:
            output += f"  Luật {rules.index(rule) + 1} ({rule}): "
            if rule.checked is True:  # nếu luật đã được chứng minh rồi
                output += "bỏ qua, vì luật đã được duyệt.\n"
                continue
            if rule.right_checked is True:  # nếu đích đã được chứng minh rồi
                output += "bỏ qua, vì đích đã được chứng minh.\n"
                continue
            if rule.right in events:  # nếu vế phải đã được chứng minh rồi
                output += f"không áp dụng, vì {rule.right} nằm trong số các events.\n"
                rule.right_checked = True
                continue

            # tìm xem là có event nào thiếu
            rule_missing = rule.search_missing(events)

            if rule_missing is None:
                # nếu không thiếu event nào -> luật này được chứng minh
                rule_applied = True
                rule.checked = True
                events.append(rule.right)
                output += "được áp dụng. Luật này được duyệt. Events: " + \
                    ", ".join(events[:total]) + " suy ra " + \
                    ", ".join(events[total:]) + ".\n"
                road.append(f"R{rules.index(rule) + 1}")
                break
            else:
                output += f"Không được áp dụng, vì thiếu event: {rule_missing}\n"
        output += "\n"
        if not rule_applied:
            write_to_file(output=output)
            return False, road, events
    write_to_file(output=output)
    return True, road, events


def write_to_file(output):
    file = open("forward_output.txt", "w", encoding='utf8')
    file.write(output)


# a = [
#     Rule(['DH-2'], 'DH-8'),
#     Rule(['DH-8'], 'DH-9'),
#     Rule(['DH-2'], 'DH-3'),
#     Rule(['DH-6', 'DH-4'], 'DH-7'),
#     Rule(['DH-5', 'DH-2'], 'DH-6'),
#     Rule(['DH-1'], 'DH-2'),
# ]

# f = [
#     'DH-1',
#     'DH-4',
#     'DH-5',
# ]

# goal = 'DH-7'

# goal, road, events, output = forward_chaining(goal=goal, rules=a, events=f)
# write_output(output)
# print()
# print(f"    Kết quả: {goal}")
# print(f"    Đường đi: {road}")
# print(f"    Events: {events}")
