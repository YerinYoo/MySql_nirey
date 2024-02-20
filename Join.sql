SELECT * FROM nirey.Contact;

use nirey;

select * from Address;

select * from Calendar;

select * from Code;

select * from CodeGroup;

select * from Company;

select * from Contact;

select * from ContactGroup;

select * from Email;

select * from img;

select * from PhoneNum;

select * from SNS;

select * from WebSite;

select count(*) from Calendar;

-- inner join
select 
a.seq
, b.Contact_seq
from
Contact a
left join PhoneNum b -- 'inner' 문자 삭제 되어도 자동으로 이너 조인 됨
on a.seq=b.Contact_seq
;

select count(*) Address;


select a.seq
, b.seq
from Contact a
left join Address b
-- inner join Address b
on b.Contact_seq=a.seq
;

select count(*) Calender;

select a.seq
, b.seq
from Contact a
join Calendar b
-- inner join Calendar b
on b.Contact_seq=a.seq
;

select count(*) Company;

select a.seq
, b.seq
from Contact a
join Company b
-- inner join Company b
on b.Contact_seq=a.seq
;


select count(*) Email;

select a.seq
, b.seq
from Contact a
left join Email b
-- inner join Email b
on b.Contact_seq=a.seq
;

select count(*) img;

select a.seq
, b.seq
from Contact a
join img b
-- inner join img b
on b.Contact_seq=a.seq
;

select count(*) PhoneNum;

select a.seq
, b.seq
from Contact a
join PhoneNum b
-- inner join PhoneNum b
on b.Contact_seq=a.seq
;

select count(*) SNS;

select a.seq, b.seq
from Contact a
join SNS b
-- inner join SNS b
on b.Contact_seq=a.seq
;

select count(*) WebSite;

select a.seq, b.seq, b.defaultNY
from Contact a
join WebSite b
-- inner join WebSite b
on b.Contact_seq=a.seq
-- and defaultNY=1 -- 해당 구문 작성 시 9번 연락처의 URL 중 디폴트가 아닌 것은 표기되지 않음
;

-- 9번 연락처가 두 개의 URL을 등록함 >> 디폴트 값을 함께 표기하여 하나만 전체 화면에서 볼 수 있도록 구현

select a.seq, a.name, b.seq, b.name
from CodeGroup a
inner join Code b
on b.CodeGroup_seq=a.seq
;

-- count 계산 쿼리 / CodeGroup seq, CodeGroup name, code 갯수
-- 서브 쿼리를 사용해야 함 (쿼리 내부에 쿼리)

select a.seq
, a.name
, (select count(*) from Code aa where aa.CodeGroup_seq=a.seq) as count -- count or cnt를 사용함 / aa의 CodeGroup_seq = a.seq가 같은 경우 갯수를 출력
from CodeGroup a
;