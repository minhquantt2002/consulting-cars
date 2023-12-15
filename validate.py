def validate_yes_no_question(value):
    a = ['1', 'y', 'yes', 'co', 'có']
    b = ['0', 'n', 'no', 'khong', 'không']
    value = value + ''
    while (1):
        if value in a:
            return True
        elif value in b:
            return False
        else:
            print("-->Chatbot: Câu trả lời không hợp lệ. Vui lòng nhập lại câu trả lời!")
            value = input('-->Tôi: ')
