
	create database chtdttt;
	use chtdttt;
	create table `loi` (
		`id` varchar(255) primary key,
		`ten` varchar(255),
		`nguyen_nhan` text,
		`khac_phuc` text
	); 

	create table `dau_hieu` (
		`id` varchar(255) primary key,
		`name` text,
        `cach_nhan_biet` text
	);

	create table `luat` (
		`id` int(11) primary key auto_increment,
		`loi_id` varchar(255),
		`dau_hieu_id` varchar(255),
		`loai_suy_dien` int,
		foreign key (`loi_id`) references `loi`(`id`),
		foreign key (`dau_hieu_id`) references `dau_hieu`(`id`)
	);

-- 
INSERT INTO dau_hieu(id, name, cach_nhan_biet) VALUES 
('DH1', 'Đèn báo lỗi hệ thống phanh phát sáng', 
'Để quan sát được hệ thống phanh thực hiện các bước: 1, Đỗ xe trên mặt phẳng, tắt động cơ và kéo phanh tay 2, Dùng kích nâng xe lên cao sao cho bánh xe không chạm đất 3, Dùng cơ lê, mỏ lết tháo bu lông bánh xe 4, lấy bánh xe ra khỏi xe 5, quan sát hệ thống phanh'),
('DH2', 'Tiếng rít phát ra từ phanh', NULL),
('DH3', 'Cảm giác đạp chân phanh quá nhẹ hoặc bị hụt', NULL),
('DH4', 'Quãng đường phanh dài, thời gian phanh dài', NULL),
('DH5', 'Đạp phanh phải sát sàn', NULL),
('DH7', 'Cảm giác lái khác thường, cảm giác xe có xu hướng lệch trái, phải, rung giật khi phanh', NULL),
('DH8', 'Màu sắc dầu phanh có màu sậm, dấu hiệu dầu phanh đã hết hạn sử dụng', '1, vị trí bình chứa dầu phanh thường được đặt ở phía trước của xe, gần với động cơ 2, xác định vị trí của nắp bình chứa dầu phanh, nắp thường có màu vàng hoặc đỏ 3, xác định loại dầu phanh xe sử dụng theo thông tin hãng xe'),
('DH9', 'Rò rỉ dầu phanh tại ống dẫn dầu gần khu vực xy lanh bánh xe, Quan sát các đường ống dẫn dầu', NULL),
('DH10', 'Má phanh bị mòn không đều, biến dạng, Quan sát trực quan bộ phận má phanh', NULL),
('DH11', 'Má phanh bị lỏng, Quan sát trực quan bộ phận má phanh', NULL),
('DH12', 'Chiều dày má phanh nhỏ hơn 3mm, Dùng thước đo để đo độ dày má phanh', NULL),
('DH13', 'Má phanh cứng, không đàn hồi, Quan sát trực quan bộ phận má phanh', NULL),
('DH14', 'Đĩa phanh bị biến biến dạng, mòn không đều, cong vênh, Quan sát trực quan bộ phận đĩa phanh', NULL),
('DH15', 'Đĩa phanh bị lỏng, Quan sát trực quan bộ phận đĩa phanh', NULL),
('DH16', 'Độ dày đĩa phanh nhỏ hơn 10mm, Dùng thước đo để đo độ dày đĩa phanh', NULL),
('DH17', 'Đĩa phanh bị nứt, Quan sát trực quan bộ phận đĩa phanh', NULL),
('DH18', 'Bàn đạp phanh cao hơn bình thường', NULL),
('DH19', 'Xe khó khởi động', NULL),
('DH20', 'Điều hòa không mát hoặc không hoạt động', NULL),
('DH21', 'Đèn pha bị mờ, thậm chí tắt hẳn', NULL),
('DH22', 'Các thiết bị điện tử trên xe hoạt động không ổn định', NULL),
('DH23', 'Tiếng ồn phát ra khi khởi động', NULL),
('DH24', 'Xuất hiện mùi khói hoặc mùi axit từ bình điện', 'Mở cốp xe, kiểm tra vị trí bình điện'),
('DH25', 'Mùi cháy khét khi khởi động, sự cố cháy cầu chì khởi động liên tục', NULL),
('DH26', 'Khi động cơ đốt trong đã làm việc mà vẫn còn tiếng rít mạnh của máy khởi động', 'Khởi động xe, khi động cơ đốt trong đã chạy'),
('DH27', 'Quan sát thấy bình điện bị rỉ các đầu cọc điện', 'Mở cốp xe, kiểm tra vị trí bình điện'),
('DH28', 'Thấy rò rỉ chất lỏng từ bình điện', 'Mở cốp xe, kiểm tra vị trí bình điện'),
('DH29', 'Quan sát thấy nứt vỡ vỏ bình', 'Mở cốp xe, kiểm tra vị trí bình điện'),
('DH30', 'Chẩn đoán đo nồng độ dung dịch bằng tỷ trọng kế: nồng độ quá thấp', 'Kiểm tra mức độ dung dịch bằng ống thủy tinh  hoặc que gỗ nếu thấp hơn 10-15ml so với lắp bình thì bổ sung nước cất rồi đợi. Sau 2h sử dụng tỷ trọng kế kiểm tra nồng dịch trong bình'),
('DH31', 'Chẩn đoán đo nồng độ dung dịch bằng Ampe kế: điện áp quá thấp', 'Kiểm tra mức độ dung dịch bằng ống thủy tinh hoặc que gỗ nếu thấp hơn 10-15ml so với lắp bình thì bổ sung nước cất rồi đợi. Sau 2h sử dụng Ampe kế kiểm tra nồng độ dung dịch trong bình'),
('DH32', 'Giọt nước bốc hơi nhanh và có hiện tượng sôi', 'Tìm vị trí máy phát điện trong cốp: dùng vài giọt nước nhỏ lên mặt máy phát điện'),
('DH33', 'Điện áp phát ra không ổn định khi đo (<13,5V)', 'Tìm vị trí máy phát điện và đo điện áp phát ra bằng Vônmét'),
('DH34', 'Điện áp thấp hơn 9V', 'Kiểm tra điện áp bằng cách đấu vôn kế song song với máy khởi động'),
('DH35', 'Điện áp không thay đổi hoặc thay đổi rất nhỏ (10V - 11V) và máy khởi động không quay', 'Khi kiểm tra điện áp bằng cách đấu vôn kế song song với máy khởi động');


-- 

INSERT INTO loi(id, ten, nguyen_nhan, khac_phuc) VALUES 
('L1', 'Lỗi hệ thống phanh do dầu phanh', 
 'Dầu phanh hỏng do nhiều nguyên nhân: 
  Rò rỉ dầu từ đường ống
  Dầu phanh bị nhiễm bẩn như bụi, nước,..
  Dầu phanh xuống cấp theo thời gian', 
 'Nếu dầu phanh bị rò rỉ thì cần tìm vị trí rò rỉ, khắc phục chỗ rò rỉ, thêm dầu phanh 
  Thay dầu phanh mới 
  Thay dầu phanh theo khuyến nghị của nhà sản xuất
  Thay dầu phanh sai khoảng 20000 đến 30000 km'),
('L2', 'Lỗi hệ thống phanh tại má phanh', 
 'Má phanh chịu mài mòn theo thời gian, cần được thay thế theo định kỳ.
  Má phanh nếu bị mòn không đều có thể do: 
  kẹp phanh bị lệch 
  tang trống hoặc đĩa phanh bị cong 
  đường dẫn dầu bị tắc
  Má phanh có thể bị vỡ hoặc nứt do sử dụng không đúng cách',
 'Má phanh bị mòn quá mức hoặc mòn không đồng đều cần tiến hành thay mới và thực hiện theo hướng dẫn của nhà sản xuất xe
  Má phanh bị vỡ hoặc nứt cần thay thế mới và kiểm tra các bộ phận khác của hệ thống phanh để tìm nguyên nhân hư hỏng
  Các bước thay thế má phanh 
  1, Tháo bánh xe
  2, Tháo kẹp phanh
  3, Tháo má phanh cũ 
  4, Lắp má phanh mới đảm bảo đúng vị trí và hướng
  5, Lắp kẹp phanh 
  6, Lắp bánh xe
  Kiểm tra đồng thời đĩa phanh hoặc tang trống'),
('L3', 'Lỗi hệ thống phanh  tại đĩa phanh', 
 'Đĩa phanh chịu mài mòn theo thời gian, cần được thay thế theo định kỳ.
  Đĩa phanh nếu bị mòn không đều có thể do: 
  má phanh mòn không đều 
  kẹp phanh bị lệch 
  tang trống hoặc đĩa phanh bị cong 
  đường dẫn dầu bị tắc
  đĩa phanh có thể bị vỡ hoặc nứt, cong vênh do sử dụng không đúng cách', 
 'Đĩa phanh bị mòn quá mức hoặc mòn không đồng đều cần tiến hành thay mới và thực hiện theo hướng dẫn của nhà sản xuất xe
  Đĩa phanh bị vỡ hoặc nứt cần thay thế mới và kiểm tra các bộ phận khác của hệ thống phanh để tìm nguyên nhân hư hỏng
  Các bước thay thế má phanh 
  1, Tháo bánh xe
  2, Tháo kẹp phanh
  3, Tháo đĩa phanh cũ 
  4, Lắp đĩa phanh mới đảm bảo đúng vị trí và hướng
  5, Lắp kẹp phanh 
  6, Lắp bánh xe
  Kiểm tra đồng thời má phanh hoặc tang trống
  Tránh phanh gấp hoặc phanh liên tục trên đường dốc'),
('L4', 'Hỏng máy phát điện xoay chiều',
 'Các ổ bi bị mòn do làm việc ở tốc độ cao => va chạm giữa stator và rotor , khe hở từ không ổn định, dao động điện áp, máy phát bị nóng
  Chổi than bị mòn, dòng kích từ yếu, giảm điện áp máy phát
  Chạm mạch roto, gây mất điện áp ra hoặc điện áp yếu.
  Chùng dây đai kéo máy phát, vừa gây trượt, tiếng ồn và giảm điện áp',
 'Tùy theo mức độ hư hỏng của máy phát điện mà có thể khắc phục theo các cách sau:
  Kiểm tra và sửa chữa các chi tiết bên trong máy phát điện. Nếu các chi tiết bên trong máy phát điện chỉ bị hao mòn, hư hỏng nhẹ, có thể được sửa chữa để tiếp tục sử dụng.
  Thay thế máy phát điện mới. Nếu các chi tiết bên trong máy phát điện bị hư hỏng nặng, không thể sửa chữa, cần thay thế máy phát điện mới.
  Nếu bạn không có kinh nghiệm sửa chữa ô tô, tốt nhất nên mang xe đến các gara ô tô uy tín để được kiểm tra và sửa chữa.
  Giá thay thế máy phát điện ô tô dao động từ 10 triệu đồng đến 20 triệu đồng, tùy thuộc vào loại xe và hãng sản xuất.
  Một số lưu ý khi sử dụng máy phát điện ô tô:
  Thường xuyên kiểm tra và bảo dưỡng máy phát điện định kỳ, sau mỗi 30.000 - 50.000 km.
  Sử dụng ắc quy phù hợp với xe.
  Không đấu nối sai các dây điện.
  Không sử dụng các thiết bị điện có công suất lớn khi máy phát điện đang hoạt động.
  Việc bảo dưỡng máy phát điện ô tô định kỳ sẽ giúp phát hiện và khắc phục các hư hỏng sớm, tránh làm hỏng nặng máy phát điện và các thiết bị điện trên xe.'),
('L5', 'Hỏng bình điện axit',
 'Cong vênh tấm cực do va chạm hoặc nạp điện ở nhiệt độ cao hơn 50 độ, dẫn tới chạm mạch bên trong các tấm cực của bình điện
  Chai tấm cực, mất khả năng trao đổi điện tử và ion tạo nên các phản ứng hóa học , bình điện không đảm bảo khả năng tích điện ở điện áp quy định.
  Nồng độ dung dịch không đảm bảo, thiếu dung dịch điện phân.', 
 'Tùy theo mức độ hư hỏng của bình điện mà có thể khắc phục theo các cách sau:
  Nạp điện cho bình điện. Nếu bình điện chỉ bị hết điện, có thể nạp điện cho bình điện để tiếp tục sử dụng.
  Thay thế dung dịch axit trong bình điện. Nếu bình điện bị cạn axit hoặc axit bị hỏng, có thể thay thế dung dịch axit trong bình điện để tiếp tục sử dụng.
  Thay thế bình điện mới. Nếu bình điện bị hư hỏng nặng, không thể sửa chữa, cần thay thế bình điện mới.
  Nếu bạn không có kinh nghiệm sửa chữa ô tô, tốt nhất nên mang xe đến các gara ô tô uy tín để được kiểm tra và sửa chữa.
  Giá thay thế bình điện ô tô dao động từ 1 triệu đồng đến 5 triệu đồng, tùy thuộc vào loại xe và hãng sản xuất.
  Việc bảo dưỡng bình điện axit xe ô tô định kỳ sẽ giúp phát hiện và khắc phục các hư hỏng sớm, tránh làm hỏng nặng bình điện và các thiết bị điện trên xe.
  Ngoài ra, bạn cũng có thể tham khảo một số mẹo sau để khắc phục tạm thời tình trạng bình điện axit xe ô tô bị hỏng:
  Nếu xe khó khởi động, có thể thử khởi động lại xe sau một vài phút.
  Nếu đèn pha bị mờ, có thể thử giảm độ sáng của đèn pha.
  Nếu các thiết bị điện trên xe hoạt động không ổn định hoặc không hoạt động được, có thể thử tắt các thiết bị điện không cần thiết.
  Tuy nhiên, những cách khắc phục tạm thời này chỉ có thể giúp bạn sử dụng xe trong một thời gian ngắn. Bạn nên mang xe đến gara ô tô uy tín để được kiểm tra và sửa chữa càng sớm càng tốt.'),
('L6', 'Hỏng máy khởi động',
 'Cháy hỏng các tiếp điểm khởi động, cổ góp cháy bẩn, chổi than mòn/kẹt, các cuộn dây chập đứt, hỏng rơle đóng mạch khởi động
Hỏng phần cơ khí: kẹt khớp một chiều hay trượt quay, mòn bạc hay ổ bi, mòn bánh răng…
Bánh răng khởi động không khớp với bánh đà
Kẹt bánh răng khởi động, vị trí của bánh răng khởi động quá xa
Khớp gài không trả về do hư hỏng ở rãnh di chuyển bánh răng khởi động , kẹt bánh răng tiếp điểm khởi động bị dính 
Mòn các ổ đỡ, lỏng ốc bắt  khởi động',
'Tùy theo mức độ hư hỏng của máy khởi động mà có thể khắc phục theo các cách sau:
Sửa chữa các chi tiết bên trong máy khởi động. Nếu các chi tiết bên trong máy khởi động chỉ bị hao mòn, hư hỏng nhẹ, có thể được sửa chữa để tiếp tục sử dụng.
Thay thế các chi tiết bên trong máy khởi động. Nếu các chi tiết bên trong máy khởi động bị hư hỏng nặng, không thể sửa chữa, cần thay thế các chi tiết đó.
Thay thế máy khởi động mới. Nếu máy khởi động bị hư hỏng nặng, không thể sửa chữa, cần thay thế máy khởi động mới.
Nếu bạn không có kinh nghiệm sửa chữa ô tô, tốt nhất nên mang xe đến các gara ô tô uy tín để được kiểm tra và sửa chữa.
Giá thay thế máy khởi động ô tô dao động từ 5 triệu đồng đến 10 triệu đồng, tùy thuộc vào loại xe và hãng sản xuất.
Một số lưu ý khi sử dụng máy khởi động ô tô:
Thường xuyên kiểm tra và bảo dưỡng máy khởi động định kỳ, sau mỗi 30.000 - 50.000 km.
Không để máy khởi động hoạt động quá lâu.
Không sử dụng máy khởi động khi động cơ đang nóng.
Việc bảo dưỡng máy khởi động ô tô định kỳ sẽ giúp phát hiện và khắc phục các hư hỏng sớm, tránh làm hỏng nặng máy khởi động và các thiết bị điện trên xe.
Ngoài ra, bạn cũng có thể tham khảo một số mẹo sau để khắc phục tạm thời tình trạng máy khởi động xe ô tô bị hỏng:
Nếu xe không khởi động được, có thể thử đẩy xe hoặc dùng dây cáp để khởi động xe.
Nếu máy khởi động phát ra tiếng kêu lách cách hoặc tiếng kêu rít, có thể thử tra dầu bôi trơn cho máy khởi động.
Tuy nhiên, những cách khắc phục tạm thời này chỉ có thể giúp bạn sử dụng xe trong một thời gian ngắn. Bạn nên mang xe đến gara ô tô uy tín để được kiểm tra và sửa chữa càng sớm càng tốt.');

--
INSERT INTO luat (dau_hieu_id, loai_suy_dien, loi_id)
VALUES ('DH1', 0, 'L1'),
('DH1', 0, 'L2'),
('DH1', 0, 'L3'),
('DH2', 0, 'L2'),
('DH2', 0, 'L3'),
('DH3', 0, 'L1'),
('DH3', 0, 'L2'),
('DH3', 0, 'L3'),
('DH4', 0, 'L2'),
('DH4', 0, 'L3'),
('DH5', 0, 'L1'),
('DH5', 0, 'L2'),
('DH5', 0, 'L3'),
('DH19', 0, 'L4'),
('DH19', 0, 'L5'),
('DH19', 0, 'L6'),
('DH20', 0, 'L4'),
('DH20', 0, 'L5'),
('DH21', 0, 'L4'),
('DH21', 0, 'L5'),
('DH22', 0, 'L4'),
('DH22', 0, 'L5'),
('DH23', 0, 'L4'),
('DH23', 0, 'L6');

INSERT INTO luat (dau_hieu_id, loai_suy_dien, loi_id)
VALUES 
('DH8', 1, 'L1'),
('DH9', 1, 'L1'),
('DH7', 1, 'L2'),
('DH10', 1, 'L2'),
('DH12', 1, 'L2'),
('DH7', 1, 'L2'),
('DH11', 1, 'L2'),
('DH13', 1, 'L2'),
('DH7', 1, 'L3'),
('DH14', 1, 'L3'),
('DH16', 1, 'L3'),
('DH17 ', 1, 'L3'),
('DH15', 1, 'L3'),
('DH19', 1, 'L4'),
('DH20', 1, 'L4'),
('DH21', 1, 'L4'),
('DH22', 1, 'L4'),
('DH23', 1, 'L4'),
('DH32', 1, 'L4'),
('DH33', 1, 'L4'),
('DH24', 1, 'L5'),
('DH27', 1, 'L5'),
('DH28', 1, 'L5'),
('DH29', 1, 'L5'),
('DH19', 1, 'L5'),
('DH20', 1, 'L5'),
('DH21', 1, 'L5'),
('DH30', 1, 'L5'),
('DH22', 1, 'L5'),
('DH31', 1, 'L5'),
('DH23', 1, 'L6'),
('DH26', 1, 'L6'),
('DH34', 1, 'L6'),
('DH19', 1, 'L6'),
('DH25', 1, 'L6'),
('DH35', 1, 'L6');



