-- CGV 클론 시드 데이터

-- 영화 데이터 (상영중 12개)
INSERT INTO movies (title, genre, synopsis, director, "cast", duration, rating, poster_url, release_date, status) VALUES
('범죄도시 4', '액션/범죄', '괴물형사 마석도가 온라인 도박 조직의 실체를 추적하며 소탕하는 이야기.', '허명행', '마동석, 김무열, 박지환', 109, '15세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMjVfODEg%2FMDAxNzExMzM4Nzk2ODM3.RVEA3FVQzsZJ6N4XXZkG30NhAqBVagqFXRdMTlV5SeAg.TV1UabpQ51NXyUKhQpxv8gg99g-kdHHf6XaNhfxP__0g.JPEG%2F434218168_739225701649136_2915540471675226756_n.jpg&type=sc960_832', '2024-04-24', 'showing'),
('파묘', '미스터리/스릴러', '미국 LA에서 원인 모를 병에 시달리는 한 집안의 의뢰를 받은 풍수사와 장의사 팀이 묘를 이장하면서 벌어지는 이야기.', '장재현', '최민식, 김고은, 유해진, 이도현', 134, '15세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMDJfMjkx%2FMDAxNzA5MzU0ODg0NDgz.7gCmJIBs8rvzg4Qiyhv4QtXulNMpjrd6aeORrd482J4g.aLgOnlCsa-x3dCaxRqWXjBBcNHhflN4lvR9qPiao7ykg.JPEG%2F11.jpg&type=sc960_832', '2024-02-22', 'showing'),
('듄: 파트 2', 'SF/모험', '아라키스 행성에서 프레멘 부족과 합류한 폴 아트레이데스가 우주의 운명을 건 전투에 나서는 이야기.', '드니 빌뇌브', '티모시 샬라메, 젠데이아, 오스틴 버틀러', 166, '12세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTA0MjhfMTM1%2FMDAxNzQ1NzcwNDE1NzU4.KWc6xZkyVEaP0_HigIZR8mj9GhtMCvpyNc8whkGWidUg.R3K8oZe9zrJF01AwUar3aO4bqRwAxZnJahSMBXv3SCQg.JPEG%2F%25BD%25BA%25C5%25A9%25B8%25B0%25BC%25A6_27-4-2025_2077_namu.wiki.jpeg&type=sc960_832', '2024-02-28', 'showing'),
('쿵푸팬더 4', '애니메이션/코미디', '드래곤 전사 포가 새로운 악당과 맞서며 진정한 영웅의 길을 찾아가는 이야기.', '마이크 미첼', '잭 블랙, 아콰피나', 94, '전체', 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi2.ruliweb.com%2Fimg%2F23%2F12%2F14%2F18c64e766354514a9.jpg&type=sc960_832', '2024-04-10', 'showing'),
('오펜하이머', '전기/드라마', '원자폭탄 개발을 이끈 물리학자 로버트 오펜하이머의 삶과 도덕적 딜레마.', '크리스토퍼 놀란', '킬리언 머피, 에밀리 블런트, 로버트 다우니 주니어', 180, '15세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA3MDhfMjE4%2FMDAxNjg4Nzg1OTQxODIy.mFdARusnoTy0BeQ4VU3Y_gzanorbIyZteTgpxFtEFcwg.Qqrw0FTebvC1LWOmzEEAMQrwttVHLYtnVxRj06FOLqog.JPEG.cinekiru%2FIMG_8265.JPG&type=sc960_832', '2024-03-15', 'showing'),
('서울의 봄', '드라마/역사', '1979년 12.12 군사반란 당시 민주주의를 지키려 한 군인들의 9시간 이야기.', '김성수', '황정민, 정우성, 이성민', 141, '12세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzExMDZfNjIg%2FMDAxNjk5MjQ3NTk2NTA5.RuirKpLzhf2A7ERj7x0aKW4b34O0uKPFk0Zm2m7-xPMg.hcAcPx4cWvFU5WiI4Roz73Mdj9ZAvG3wcrzeHH4fp84g.JPEG.qwerr1225%2Fuuuuu.jpg&type=sc960_832', '2024-01-10', 'showing'),
('위시', '애니메이션/뮤지컬', '소원을 이루어주는 마법의 왕국에서 진정한 소원의 의미를 찾아가는 소녀의 이야기.', '크리스 벅', '아리아나 드보스, 크리스 파인', 95, '전체', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMjhfMTM3%2FMDAxNzAzNjkwNzgzNTk3.LeNJtQwEo01yQyO5Bjwbu2sSOOXvtdqJi8jfAcznAe8g.vd3eAVLssvdpOEv5HOeFBBRny-YkJZiacUixCDLUkA8g.JPEG.0307khy%2FScreenshot%25A3%25DF20231228%25A3%25DF002449%25A3%25DFNAVER.jpg&type=sc960_832', '2024-01-25', 'showing'),
('가여운 것들', '드라마/판타지', '빅토리아 시대를 배경으로 새로운 삶을 살게 된 한 여성의 자유와 모험.', '요르고스 란티모스', '엠마 스톤, 마크 러팔로', 141, '18세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAzMDhfMTYz%2FMDAxNzA5ODI5NTQzNDQ3.ARzdM-HpfG_ohffG0CfQu21W82J-vjG3wcycwkefKzcg.kn96zQoNifFWk9KLnICAkEdfZ8Bupd5nvSLxhMoUxl8g.JPEG%2FmPdeQ1H6IXDAXtwQ2EdQuSCNmwV.jpg&type=sc960_832', '2024-02-14', 'showing'),
('소년시절의 너', '로맨스/드라마', '고등학교 시절 운명적으로 만난 두 소년소녀의 아름답고 슬픈 성장 이야기.', '증국상', '주동우, 이양천시', 135, '15세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA4MjZfNTcg%2FMDAxNzI0NjU2NTU2MTA5.ltCd0I9nhTWZBXQwy9CK7QaTvTl95I9jMjt4nAQCqHYg.X81mbWM7orZ9kkVrU17-5m-u6g70gJkFWIv56wJqoygg.PNG%2Fimage.png&type=sc960_832', '2024-03-20', 'showing'),
('고질라 x 콩: 뉴 엠파이어', 'SF/액션', '고질라와 콩이 힘을 합쳐 지하세계의 거대한 위협에 맞서는 이야기.', '아담 윙가드', '레베카 홀, 브라이언 타이리 헨리', 115, '12세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAyMjVfMTUg%2FMDAxNjE0MjQ4MjQ0NjE1.ZwzdNJCjW4MqkvNRkMCFkD0U_e9QuDRyFoB3siz1nkYg.1mzVtrhHefBM2wy0gvB-guZzC1woMrkWTajAQ5rdUk0g.JPEG.battefield%2Fnouvellevague-20210225-180312-000.jpg&type=sc960_832', '2024-04-11', 'showing'),
('귀멸의 칼날: 무한성편', '애니메이션/액션', '탄지로 일행이 상현의 귀신과 무한성에서 치열한 전투를 벌이는 극장판.', '하라이 타쿠야', '하나에 나츠키, 키토 아카리', 100, '15세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTA4MjNfNjYg%2FMDAxNzU1OTE2NzMxNTcw.44m-L5Qr3OXHb_HJC1AZtF5YzFk3_QBT1ZQt_mTweHMg.PDbBWlH22zQ_DVAH423bcPLFoyPDNhFBs0oE9BvGl0kg.JPEG%2F%25C8%25AD%25B8%25E9_%25C4%25B8%25C3%25B3_2025-08-23_112850.jpg&type=sc960_832', '2024-04-05', 'showing'),
('웡카', '가족/판타지', '초콜릿 공장의 비밀 속 윌리 웡카의 젊은 시절 이야기.', '폴 킹', '티모시 샬라메, 올리비아 콜맨', 116, '전체', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDExMjBfMzQg%2FMDAxNzMyMDg5NDIyOTkz.0PJYfz-viQqjbO6LVdM6UsoPveJolQexZUKrYR1FYQkg.iMomtD2UdR2ZEy5uca3gHab35xCwFed_sKkG9vy62oAg.JPEG%2F%25BF%25FD%25C4%25AB_%25C6%25F7%25BD%25BA%25C5%25CD.jpg&type=sc960_832', '2024-01-31', 'showing');

-- 영화 데이터 (개봉 예정 5개)
INSERT INTO movies (title, genre, synopsis, director, "cast", duration, rating, poster_url, release_date, status) VALUES
('인사이드 아웃 2', '애니메이션/코미디', '라일리가 사춘기에 접어들면서 새로운 감정들이 등장하고 기존 감정들과 충돌하는 이야기.', '켈시 만', '에이미 폴러, 마야 호크', 100, '전체', 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.extmovie.com%2Ffiles%2Fattach%2Fimages%2F135%2F759%2F011%2F092%2F26293992f54d1d0b6d51b0704d3a8069.jpeg&type=sc960_832', '2024-06-12', 'upcoming'),
('글래디에이터 2', '액션/역사', '로마 제국의 검투사가 된 남자가 자유와 복수를 위해 싸우는 속편.', '리들리 스콧', '폴 메스칼, 덴젤 워싱턴', 148, '15세', 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimg.extmovie.com%2Ffiles%2Fattach%2Fimages%2F135%2F594%2F556%2F092%2F4a30f1f7330c48ab7cb8ac7c24b8cb04.jpg&type=sc960_832', '2024-11-22', 'upcoming'),
('데드풀과 울버린', '액션/코미디', '데드풀과 울버린이 만나 마블 멀티버스를 넘나드는 모험.', '숀 레비', '라이언 레이놀즈, 휴 잭맨', 127, '15세', 'https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.namu.wiki%2Fi%2Fa5sxSZ0_EQU3NQU67j1RsDnVgVKbCBs9AG-Kyr22asfaw0WR7gvjLvErS10xTJcTUop9o_0nKQknMwYcIRpo1Q.webp&type=sc960_832', '2024-07-25', 'upcoming'),
('모아나 2', '애니메이션/모험', '모아나가 새로운 항해를 떠나 미지의 바다에서 전설적인 위험과 마주하는 이야기.', '데이비드 디릭', '아울리이 크라발료, 드웨인 존슨', 100, '전체', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA5MjhfNDcg%2FMDAxNzI3NTI1ODM0MjA0.yFLhBeXF_Nq3rmk57f00FsQA8uCy-I_fbsEORMPeXuAg.mDzco3kB8tLUiurs0c7Lzs0xQcfo1ev0IuBjPGHqSZEg.JPEG%2FMOANA_2.jpg&type=sc960_832', '2024-11-27', 'upcoming'),
('조커: 폴리 아 되', '드라마/스릴러', '아서 플렉이 아캄 수용소에서 만난 여성과 광기의 음악을 만들어가는 이야기.', '토드 필립스', '호아킨 피닉스, 레이디 가가', 138, '18세', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA5MDlfMjA0%2FMDAxNzI1ODUxOTI2NzM5.6mDtAgEfaUlBM73QGBAKgRsDty4lEwT40U28Z8xDvZ4g.QJK99-QnkF6DfykWbWVDwlL3zDP19GYA6ayyZcbb7ZYg.JPEG%2Fjoker-folie-a-deux_poster_goldposter_com_23.jpg&type=sc960_832', '2024-10-04', 'upcoming');

-- 극장 데이터
INSERT INTO theaters (name, location) VALUES
('CGV 강남', '서울특별시 강남구 강남대로 438'),
('CGV 용산아이파크몰', '서울특별시 용산구 한강대로23길 55'),
('CGV 영등포', '서울특별시 영등포구 영중로 15'),
('CGV 수원', '경기도 수원시 팔달구 덕영대로 924');

-- 상영관 데이터
INSERT INTO screens (theater_id, name, total_seats) VALUES
(1, '1관', 80), (1, '2관', 120), (1, 'IMAX관', 200),
(2, '1관', 80), (2, '2관', 100), (2, '4DX관', 60),
(3, '1관', 80), (3, '2관', 100), (3, '3관', 80),
(4, '1관', 80), (4, '2관', 100), (4, 'SCREENX관', 150);

-- 상영 스케줄 (향후 7일)
INSERT INTO schedules (movie_id, screen_id, date, start_time, end_time) VALUES
(1, 1, CURRENT_DATE::text, '10:00', '11:49'),
(1, 4, CURRENT_DATE::text, '14:00', '15:49'),
(2, 2, CURRENT_DATE::text, '11:00', '13:14'),
(3, 3, CURRENT_DATE::text, '13:00', '15:46'),
(4, 5, CURRENT_DATE::text, '10:30', '12:04'),
(5, 6, CURRENT_DATE::text, '19:00', '22:00'),
(6, 7, CURRENT_DATE::text, '16:00', '18:21'),
(7, 8, CURRENT_DATE::text, '11:00', '12:35'),
(1, 1, (CURRENT_DATE + 1)::text, '10:00', '11:49'),
(2, 2, (CURRENT_DATE + 1)::text, '13:00', '15:14'),
(3, 3, (CURRENT_DATE + 1)::text, '16:00', '18:46'),
(4, 4, (CURRENT_DATE + 1)::text, '10:00', '11:34'),
(8, 5, (CURRENT_DATE + 1)::text, '19:00', '21:21'),
(9, 6, (CURRENT_DATE + 1)::text, '14:00', '16:15'),
(10, 7, (CURRENT_DATE + 1)::text, '20:00', '21:55'),
(1, 1, (CURRENT_DATE + 2)::text, '14:00', '15:49'),
(2, 3, (CURRENT_DATE + 2)::text, '10:00', '12:14'),
(5, 2, (CURRENT_DATE + 2)::text, '19:00', '22:00'),
(6, 5, (CURRENT_DATE + 2)::text, '16:00', '18:21'),
(11, 8, (CURRENT_DATE + 2)::text, '13:00', '14:40'),
(1, 4, (CURRENT_DATE + 3)::text, '10:00', '11:49'),
(3, 1, (CURRENT_DATE + 3)::text, '13:00', '15:46'),
(7, 7, (CURRENT_DATE + 3)::text, '11:00', '12:35'),
(12, 9, (CURRENT_DATE + 3)::text, '15:00', '16:56'),
(2, 2, (CURRENT_DATE + 4)::text, '10:00', '12:14'),
(4, 5, (CURRENT_DATE + 4)::text, '14:00', '15:34'),
(8, 3, (CURRENT_DATE + 4)::text, '19:00', '21:21'),
(10, 6, (CURRENT_DATE + 4)::text, '16:00', '17:55'),
(1, 1, (CURRENT_DATE + 5)::text, '10:00', '11:49'),
(5, 3, (CURRENT_DATE + 5)::text, '19:00', '22:00'),
(9, 4, (CURRENT_DATE + 5)::text, '14:00', '16:15'),
(11, 7, (CURRENT_DATE + 5)::text, '20:00', '21:40'),
(1, 2, (CURRENT_DATE + 6)::text, '13:00', '14:49'),
(3, 3, (CURRENT_DATE + 6)::text, '16:00', '18:46'),
(6, 1, (CURRENT_DATE + 6)::text, '10:00', '12:21'),
(12, 8, (CURRENT_DATE + 6)::text, '19:00', '20:56');
