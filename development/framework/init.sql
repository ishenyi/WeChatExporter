CREATE TABLE ChatData (
    MesLocalID integer,
    CreateTime integer,
    Message text,
    Status integer,
    ImgStatus integer,
    Type integer, Des integer,
    resourceName text,
    thumbnailName text
);
CREATE INDEX ChatData_Index on ChatData(MesLocalID);
CREATE INDEX ChatData_Index2 on ChatData(CreateTime);
CREATE INDEX ChatData_Index3 on ChatData(Status);