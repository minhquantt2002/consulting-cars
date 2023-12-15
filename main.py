from typing import List

from data import Data
from forward_chaining import forward_chaining, Rule as ForwardRule
from backward_chaining import backward_chaining, Rule as BackwardRule

from validate import validate_yes_no_question

data = Data()
data.get_list_signs()
data.get_foward_rules()
data.get_backward_rules()

list_signs = [
    data.signs[0],
    data.signs[8],
    data.signs[9],
]

list_signs_q2 = [
    [
        data.signs[2],
        data.signs[4],
        data.signs[5],
    ],
    [
        data.signs[19],
        data.signs[20],
        data.signs[21],
        data.signs[22],
    ]
]

list_txt_q2 = [
    '-->Chatbot: Có lẽ hệ thống phanh của bạn có vấn đề, hãy cho tôi biết cảm nhận khi đạp phanh của bạn. Hãy chọn những cảm giác của bạn khi phanh!',
    '-->Chatbot: Có lẽ hệ thống điện của bạn có vấn đề, hãy cho tôi biết bạn có gặp những dấu hiệu dưới đây không?\n'
]

# 1. Câu hỏi tình trạng khởi động của xe
def first_question():
    while 1:
        print(f'-->Chatbot: Bạn hãy thử khởi động ô tô và quan sát bảng điều khiển, bạn thấy dấu hiệu nào dưới đây không?'
              + '\n(Nhập số thứ tự của dấu hiệu để chọn)')
        for index, value in enumerate(list_signs):
            print(f'{index + 1}. {value["name"]}')

        ans = input('-->Tôi: ')

        if int(ans) <= len(list_signs):
            return list_signs[int(ans) - 1], 0 if int(ans) == 1 else 1

# 2. Câu hỏi bổ sung cho suy diễn tiến
def second_question(category):
    while 1:
        print(list_txt_q2[category] + '\n(Nhập số thứ tự của dấu hiệu để chọn, có thể nhập nhiều lựa chọn)')
        for index, value in enumerate(list_signs_q2[category]):
            print(f'{index + 1}. {value["name"]}')
        try:
            options = list(map(int, input('-->Tôi: ').split(' ')))
            return [list_signs_q2[category][i - 1] for i in options]
        except:
            print("Vui lòng nhập lại đúng định dạng: VD: 1 2; 1; 1 2 3")
            continue


# Suy diễn tiến
def do_forward_chaining(rules: List[ForwardRule], events: List[str]):
    goal, road, events = forward_chaining(rules, events)
    predicted_errors = [i for i in events if i[0] == 'L']
    print(
        f'-->Chatbot: Chúng tôi dự đoán xe của bạn có thể gặp {len(predicted_errors)} lỗi sau:')
    for index, value in enumerate(predicted_errors):
        error = data.get_error_by_id(id=value)
        print(f'{index + 1}. {error["name"]}')
    print(f'-->Chatbot: Trên đây là chuẩn đoán sơ bộ của chúng tôi. Tiếp theo, chúng tôi sẽ hỏi Bạn một số câu hỏi để đưa ra kết quả chính xác.')
    return events, predicted_errors


# Suy diễn lùi
def do_backward_chaining(
        rules: List[BackwardRule], 
        events_after: List[str], 
        predicted_errors: List[str]
):
    has_error = False
    for goal in predicted_errors:
        error = data.get_error_by_id(goal)  # Chứa thông tin của lỗi có id == goal
        print(f"-->Chatbot: Ô tô của bạn có thể bị `{error['name']}`, sau đây chúng tôi muốn hỏi bạn một vài câu hỏi để tìm hiểu về lỗi trên ô tô của bạn.")
        
        signs_in_goal = []
        for s in rules:
            if goal == s.right:
                for temp in s.left:
                    signs_in_goal.append(temp)
        events = events_after.copy()
        signs_in_goal = sorted(set(signs_in_goal) - set(events_after))

        it = 0
        while it < len(signs_in_goal):
            sign = data.get_sign_by_id(signs_in_goal[it])
            print(f"Câu {it + 1}: Ô tô của bạn có dấu hiệu `{sign['name']}` không?")
            ans = validate_yes_no_question(input('-->Tôi: '))
            if ans == True:
                events.append(sign['id'])
                result = backward_chaining(rules=rules, events=events, goal=goal)

                if result == True:
                    has_error = True
                    break

            it += 1
                
        if has_error == False:
            print(f"-->Chatbot: Có lẽ ô tô bạn không bị lỗi `{error['name']}`.")

        if has_error == True:
            print(f"-->Chatbot: Ô tô của bạn bị `{error['name']}`, sau đây là nguyên nhân chính gây ra lỗi và cách khắc phục.")
            
            print(f"- Cách nguyên nhân: ")
            error['reason'] = error['reason'].replace("/n", "\n")
            print(f"{error['reason']}")

            print(f"- Cách khắc phục: ")
            error['fix'] = error['fix'].replace("/n", "\n")
            print(f"{error['fix']}")
            
            print("-->Chatbot: Xin chào và hẹn gặp lại!")
            return goal, events_after
        
    if has_error == False:
        print(f"-->Chatbot: Sau những gì bạn cung cấp, có thể phỏng đoán ô tô bạn không bị lỗi gì cả!")
        return None, events_after


# chào hỏi
print('-->Chatbot: Xin chào, tôi là chatbot tư vấn sửa chữa ô tô! Bạn muốn tôi tư vấn sửa chữa ô tô phải không?\n Hãy nhập (Y hoặc N)!')
ans = validate_yes_no_question(input('-->Tôi: '))
if ans == False:
    print('-->Chatbot: Xin chào và hẹn gặp lại!')
    import sys
    sys.exit()


# Gọi hàm cho câu hỏi thứ 1
sign, category = first_question()
list_ans = [sign.copy()]

# Gọi hàm cho câu hỏi thứ 2
signs = second_question(int(category))
list_ans.extend(signs)

# Gọi hàm suy diễn tiến
events, predicted_errors = do_forward_chaining(
    rules=data.forward_rules, 
    events=[i['id'] for i in list_ans]
)

# Gọi hàm suy diễn lùi
do_backward_chaining(
    rules=data.rules,
    events_after=[i for i in events if i[0] != 'L'],
    predicted_errors=predicted_errors
)