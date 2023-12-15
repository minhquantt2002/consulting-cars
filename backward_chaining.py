from typing import List

def write_to_file(output: str):
    file = open("backward_output.txt", "w", encoding='utf8')
    file.write(output)

class Rule:
    def __init__(self, left: List[str], right: str):
        self.left = left
        self.right = right

    def __str__(self):
        return ",".join(self.left) + "->" + self.right

def backward_chaining(rules: List[Rule], events: List[str], goal: str):
    output = ""
    for index, rule in enumerate(rules):
        output += f"{index + 1}. Với luật R{index + 1} ({', '.join(rule.left)} -> {rule.right}):\n"
        if rule.right == goal:
            check = True
            for j in rule.left:
                if j not in events:
                    # dấu hiệu không có trong events thì dừng kiểm tra luật đang xét
                    check = False
                    break
            if check is True:
                # check = True -> có luật phù hợp vs events + goal
                output += f"    -> Luật này tương ứng với ({', '.join(events)} -> {goal})\n"
                output += f"===> R{index + 1} là luật phù hợp."
                write_to_file(output=output)
                return True
        output += f"    -> Luật này không tương ứng với ({', '.join(events)} -> {goal})\n"
    output += "===> Không tìm thấy luật nào phù hợp."
    write_to_file(output=output)
    return False


# rules = [
#     Rule(['DH-1', 'DH-4'], 'L-1'),
#     Rule(['DH-1', 'DH-2', 'DH-3'], 'L-1'),
#     Rule(['DH-1', 'DH-3', 'DH-5'], 'L-1'),
#     Rule(['DH-2', 'DH-4', 'DH-5', 'DH-6'], 'L-2'),
#     Rule(['DH-2', 'DH-4', 'DH-7'], 'L-2'),
# ]
# events = ['DH-2', 'DH-4', 'DH-7']
# goal = 'L-2'

# res, ouput = backward_chainning(rules=rules, events=events, goal=goal)

# print(res)
# print(ouput)

