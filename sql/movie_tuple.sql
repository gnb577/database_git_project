BEGIN TRANSACTION;
INSERT INTO "Theater" VALUES ('CGV강남','서울',	'1544-1000','서울특별시 강남구 강남대로');
INSERT INTO "Theater" VALUES ('CGV강변','서울',	'1544-1001','서울특별시 광진구 광나루로');
INSERT INTO "Theater" VALUES ('CGV구리','경기','1544-1100',	'경기도 구리시 경춘로');
INSERT INTO "Theater" VALUES ('CGV시흥','경기','1544-1101',	'경기도 시흥시 복지로');
INSERT INTO "Theater" VALUES ('CGV부평','인천','1544-1200',	'인천광역시 부평구 마장로');
INSERT INTO "Theater" VALUES ('CGV연수역','인천','1544-1201', '인천광역시 연수구 벚꽃로');
INSERT INTO "Theater" VALUES ('CGV강릉','강원','1544-1300',	'강원도 강릉시 경강로');
INSERT INTO "Theater" VALUES ('CGV춘천','강원','1544-1301',	'강원도 춘천시 지석로');
INSERT INTO "Theater" VALUES ('CGV논산','대전',	'1544-1400','충청남도 논산시 시민로');
INSERT INTO "Theater" VALUES ('CGV대전','대전',	'1544-1401','대전광역시 중구 계백로');
INSERT INTO "Theater" VALUES ('CGV대구','대구',	'1544-1500',	'대구광역시 중구 국채보상로');
INSERT INTO "Theater" VALUES ('CGV동래','부산',	'1544-1600',	'부산광역시 동래구 중앙대로');
INSERT INTO "Theater" VALUES ('CGV해운대','부산',	'1544-1601',	'부산광역시 해운대구 해운대로');
INSERT INTO "Theater" VALUES ('메가박스 강남',	'서울',	'1544-0000',	'서울특별시 서초구 서초대로');
INSERT INTO "Theater" VALUES ('메가박스 동대문',	'서울',	'1544-0001',	'서울특별시 중구 장충단로');
INSERT INTO "Theater" VALUES ('메가박스 남양주',	'경기',	'1544-0100',	'경기도 남양주시 늘을2로');
INSERT INTO "Theater" VALUES ('메가박스 수원',	'경기',	'1544-0101',	'경기도 수원시 권선구 경수대로');
INSERT INTO "Theater" VALUES ('메가박스 송도',	'인천',	'1544-0200',	'인천광역시 연수구 송도과학로');
INSERT INTO "Theater" VALUES ('메가박스 검단'	,'인천',	'1544-0201',	'인천광역시 서구 서곶로');
INSERT INTO "Theater" VALUES ('메가박스 천안',	'대전',	'1544-0400',	'충청남도 천안시 서북구 1공단1길');
INSERT INTO "Theater" VALUES ('메가박스 대구',	'대구',	'1544-0500',	'대구광역시 북구 침산로');
INSERT INTO "Theater" VALUES ('메가박스 해운대'	,'부산',	'1544-0600',	'부산광역시 해운대구 해운대로');
INSERT INTO "Theater" VALUES ('롯데시네마 건대입구',	'서울',	'1544-8000',	'서울특별시 광진구 아차산로');
INSERT INTO "Theater" VALUES ('롯데시네마 합정',	'서울',	'1544-8001'	,'서울특별시 마포구 양화로');
INSERT INTO "Theater" VALUES ('롯데시네마 안산',	'경기'	,'1544-8100',	'경기도 안산시 상록구 충장로');
INSERT INTO "Theater" VALUES ('롯데시네마 안양',	'경기'	,'1544-8101',	'경기도 안양시 만안구 만안로');
INSERT INTO "Theater" VALUES ('롯데시네마 부평'	,'인천'	,'1544-8200'	,'인천광역시 부평구 대정로');
INSERT INTO "Theater" VALUES ('롯데시네마 검단'	,'인천',	'1544-8201',	'인천광역시 서구 완정로');
INSERT INTO "Theater" VALUES ('롯데시네마 대전','대전',	'1544-8400',	'대전광역시 서구 계룡로');
INSERT INTO "Theater" VALUES ('롯데시네마 대구현풍','대구',	'1544-8401',	'대구광역시 달성군 현풍읍 중리');
INSERT INTO "Theater" VALUES ('롯데시네마 동래','부산',	'1544-8600',	'부산광역시 동래구 중앙대로');


commit;


INSERT INTO "Movie" VALUES('도둑들',	'범죄',	'15',	'135',	'2012')
INSERT INTO "Movie" VALUES('연가시',	'드라마',	'15',	'109',	'2012')
INSERT INTO "Movie" VALUES('건축학개론',	'로맨스',	'12',	'118',	'2012')
INSERT INTO "Movie" VALUES('언터쳐블',	'코미디',	'12',	'112',	'2012')
INSERT INTO "Movie" VALUES('7번방의 선물',	'코미디',	'15',	'127',	'2013')
INSERT INTO "Movie" VALUES('변호인',	'드라마',	'15',	'127',	'2013')
INSERT INTO "Movie" VALUES('은밀하게 위대하게',	'액션',	'15',	'123',	'2013')
INSERT INTO "Movie" VALUES('신세계',	'범죄',	'19',	'134',	'2013')
INSERT INTO "Movie" VALUES('어바웃 타임',	'로맨스',	'15',	'123',	'2013')
INSERT INTO "Movie" VALUES('명량',	'액션',	'15',	'128',	'2014')
INSERT INTO "Movie" VALUES('국제시장',	'드라마',	'12',	'126',	'2014')
INSERT INTO "Movie" VALUES('인터스텔라',	'SF',	'12',	'169',	'2014')
INSERT INTO "Movie" VALUES('겨울왕국',	'애니메이션',	'0',	'108',	'2014')
INSERT INTO "Movie" VALUES('트랜스포머',	'애니메이션', '12',	'135',	'2007')
INSERT INTO "Movie" VALUES('타짜',	'범죄',	'19',	'139',	'2006')
INSERT INTO "Movie" VALUES('내부자들',	'범죄',	'19',	'130',	'2015')
INSERT INTO "Movie" VALUES('연평해전',	'드라마',	'12',	'130',	'2015')
INSERT INTO "Movie" VALUES('마션',	'SF',	'12',	'144',	'2015')
INSERT INTO "Movie" VALUES('인턴',	'코미디',	'12',	'121',	'2015')
INSERT INTO "Movie" VALUES('스물',	'코미디',	'15',	'115',	'2015')
INSERT INTO "Movie" VALUES('미니언즈',	'애니메이션',	'0',	'91',	'2015')
INSERT INTO "Movie" VALUES('부산행',	'액션',	'15',	'118',	'2016')
INSERT INTO "Movie" VALUES('인천상륙작전',	'전쟁',	'12',	'110',	'2016')
INSERT INTO "Movie" VALUES('밀정',	'액션',	'15',	'140',	'2016')
INSERT INTO "Movie" VALUES('닥터 스트레인지',	'판타지',	'12',	'115',	'2016')
INSERT INTO "Movie" VALUES('주토피아',	'애니메이션',	'0',	'108',	'2016')
INSERT INTO "Movie" VALUES('형',	'코미디',	'12',	'110',	'2016')
INSERT INTO "Movie" VALUES('너의 이름은',	'애니메이션',	'12', '106',	'2017')
INSERT INTO "Movie" VALUES('조작된 도시',	'범죄',	'15',	'126',	'2017')
INSERT INTO "Movie" VALUES('너의 결혼식',	'로맨스',	'12',	'110',	'2018')
INSERT INTO "Movie" VALUES('인크레더블',	'애니메이션',	'0',	'121',	'2004')
INSERT INTO "Movie" VALUES('태극기 휘날리며',	'전쟁',	'15',	'145',	'2004')
INSERT INTO "Movie" VALUES('실미도',	'전쟁',	'15',	'135',	'2003')
INSERT INTO "Movie" VALUES('괴물',	'판타지',	'12',	'119',	'2006')
INSERT INTO "Movie" VALUES('엑시트',	'코미디',	'12',	'103',	'2019')
INSERT INTO "Movie" VALUES('기생충',	'드라마',	'15', '131',	'2019')
INSERT INTO "Movie" VALUES('국가대표',	'드라마',	'12',	'137',	'2009')
INSERT INTO "Movie" VALUES('과속스캔들',	'코미디',	'12',	'108',	'2008')
INSERT INTO "Movie" VALUES('써니',	'코미디', '15',	'124',	'2011')
INSERT INTO "Movie" VALUES('좋은놈 나쁜놈 이상한놈',	'코미디',	'15',	'139',	'2008')
INSERT INTO "Movie" VALUES('아바타',	'SF',	'12',	'162',	'2009')


commit;


INSERT INTO "Customer" VALUES('강병국',	'11',	'남')
INSERT INTO "Customer" VALUES('고지원',	'36',	'남')
INSERT INTO "Customer" VALUES('김다희',	'58',	'여')
INSERT INTO "Customer" VALUES('김승호',	'15',	'남')
INSERT INTO "Customer" VALUES('김한나',	'15',	'여')
INSERT INTO "Customer" VALUES('김형규',	'53',	'남')
INSERT INTO "Customer" VALUES('나요한',	'19',	'남')
INSERT INTO "Customer" VALUES('문예진',	'17',	'여')
INSERT INTO "Customer" VALUES('김민지',	'48',	'여')
INSERT INTO "Customer" VALUES('김세진',	'56',	'남')
INSERT INTO "Customer" VALUES('이승수',	'25',	'남')
INSERT INTO "Customer" VALUES('신대득',	'4',	'남')
INSERT INTO "Customer" VALUES('윤정섭',	'21',	'남')
INSERT INTO "Customer" VALUES('박은서',	'25',	'남')
INSERT INTO "Customer" VALUES('이광우',	'35',	'남')
INSERT INTO "Customer" VALUES('이나영',	'13',	'여')
INSERT INTO "Customer" VALUES('이성호',	'37',	'남')
INSERT INTO "Customer" VALUES('장화영',	'26',	'여')
INSERT INTO "Customer" VALUES('정찬호',	'20',	'남')
INSERT INTO "Customer" VALUES('조민수',	'59',	'남')
INSERT INTO "Customer" VALUES('최준혁',	'50',	'남')
INSERT INTO "Customer" VALUES('홍인기', '5',	'남')
INSERT INTO "Customer" VALUES('고규희',	'3',	'여')
INSERT INTO "Customer" VALUES('최재이',	'23',	'남')
INSERT INTO "Customer" VALUES('송유빈',	'54',	'여')
INSERT INTO "Customer" VALUES('박수진',	'38',	'여')
INSERT INTO "Customer" VALUES('이태훈',	'59',	'남')
INSERT INTO "Customer" VALUES('정영빈',	'44',	'남')


