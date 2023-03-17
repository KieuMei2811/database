CREATE TRIGGER insert_lichsu BEFORE INSERT
ON lop
FOR EACH ROW
INSERT INTO lichsu VALUES (Id, new.malop, 'themmoi', now());

insert into lop values (3, 'LopA'),
					   (5,'LopB'),
                       (4,'LopC');

CREATE TRIGGER update_lichsu after UPDATE
ON lop
FOR EACH ROW
UPDATE lop 
set malop = old.malop, sukien = 'cu', date= now(); 

drop trigger update_lichsu;

update lop
set tenlop = 'lopA1'
where malop = '3';



-- THUC HANH 4 --
-- Cau 1: