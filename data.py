import mysql.connector

from forward_chaining import Rule as ForwardRule
from backward_chaining import Rule as BackwardRule

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="chtdttt"
)


class Data:
    def __init__(self):
        self.errors = []
        self.signs = []
        self.forward_rules = []
        self.rules = []

    def get_list_errors(self):
        """
        Lấy các lỗi từ bảng loi
        """
        db = mydb.cursor()
        db.execute("SELECT * FROM chtdttt.loi;")
        list_errors = db.fetchall()
        for i in list_errors:
            self.errors.append({
                'id': i[0],
                'name': i[1],
                'reason': i[2],
                'fix': i[3],
            })

    def get_error_by_id(self, id: str):
        """
        Lấy lỗi từ bảng loi theo id
        """
        db = mydb.cursor()
        db.execute(f"SELECT * FROM chtdttt.loi where id = '{id}';")
        error = db.fetchone()
        return {
            'id': error[0],
            'name': error[1],
            'reason': error[2],
            'fix': error[3],
        }

    def get_list_signs(self):
        """
        Lấy các dấu hiệu từ bảng dau_hieu
        """
        db = mydb.cursor()
        db.execute("SELECT * FROM chtdttt.dau_hieu;")
        list_signs = db.fetchall()
        for i in list_signs:
            self.signs.append({
                'id': i[0],
                'name': i[1]
            })
        self.signs.sort(key=lambda x: int(x['id'][2:]))

    def get_sign_by_id(self, id: str):
        """
        Lấy dấu hiệu từ bảng dau_hieu theo id
        """
        db = mydb.cursor()
        db.execute(f"SELECT * FROM chtdttt.dau_hieu where id = '{id}';")
        sign = db.fetchone()
        return {
            'id': sign[0],
            'name': sign[1]
        }

    def get_foward_rules(self):
        """
        Lấy các luật tiến từ bảng luat
        """
        db = mydb.cursor()
        db.execute("SELECT * FROM chtdttt.luat where loai_suy_dien = 0;")
        list_rules = db.fetchall()
        for i in list_rules:
            self.forward_rules.append(ForwardRule(left=[i[2]], right=i[1]))

    def get_backward_rules(self):
        """
        Lấy các luật luif từ bảng luat
        """
        db = mydb.cursor()
        db.execute("SELECT * FROM chtdttt.luat;")
        list_rules = db.fetchall()
        rules = []
        error_ids = set()
        for i in list_rules:
            rules.append({
                'left': i[2],
                'right': i[1]
            })
            error_ids.add(i[1])
        
        self.rules.extend([
            BackwardRule(left=[
                j['left'] for j in rules if j['right'] == i
            ], right=i)
            for i in error_ids
        ])