# MySQL-Front Dump 2.5
#
# Host: xxx   Database: TEST1000
# --------------------------------------------------------
# Server version 3.23.30-gamma


#
# Table structure for table 'Tasks'
#

CREATE TABLE Tasks (
  RECORDID int(11) NOT NULL default '0' auto_increment,
  RESOURCEID int(11) NOT NULL default '0',
  COMPLETE enum('N','Y') default 'N',
  DESCRIPTION char(255) default NULL,
  DETAILS char(255) default NULL,
  CREATEDON  DATETIME NOT NULL,
  PRIORITY int(11) default NULL,
  CATEGORY int(11) default NULL,
  COMPLETEDON  DATETIME,
  DUEDATE  DATETIME,
  USERFIELD0 char(100) default NULL,
  USERFIELD1 char(100) default NULL,
  USERFIELD2 char(100) default NULL,
  USERFIELD3 char(100) default NULL,
  USERFIELD4 char(100) default NULL,
  USERFIELD5 char(100) default NULL,
  USERFIELD6 char(100) default NULL,
  USERFIELD7 char(100) default NULL,
  USERFIELD8 char(100) default NULL,
  USERFIELD9 char(100) default NULL,
  PRIMARY KEY (RECORDID),
  KEY ResID_ndx(RESOURCEID),
  KEY DueDate(DUEDATE),
  KEY CompletedOn(COMPLETEDON)
);



#
# Table structure for table 'Contacts'
#

CREATE TABLE Contacts (
  RECORDID int(11) NOT NULL default '0' auto_increment,
  RESOURCEID int(11) NOT NULL default '0',
  FIRSTNAME char(50) default NULL,
  LASTNAME char(50) NOT NULL default '',
  BIRTHDATE date default NULL,
  ANNIVERSARY date default NULL,
  TITLE char(50) default NULL,
  COMPANY char(50) NOT NULL default '',
  JOB_POSITION char(30) default NULL,
  ADDRESS char(100) default NULL,
  CITY char(50) default NULL,
  STATE char(25) default NULL,
  ZIP char(10) default NULL,
  COUNTRY char(25) default NULL,
  NOTE char(255) default NULL,
  PHONE1 char(25) default NULL,
  PHONE2 char(25) default NULL,
  PHONE3 char(25) default NULL,
  PHONE4 char(25) default NULL,
  PHONE5 char(25) default NULL,
  PHONETYPE1 int(11) default NULL,
  PHONETYPE2 int(11) default NULL,
  PHONETYPE3 int(11) default NULL,
  PHONETYPE4 int(11) default NULL,
  PHONETYPE5 int(11) default NULL,
  CATEGORY int(11) default NULL,
  EMAIL char(100) default NULL,
  CUSTOM1 char(100) default NULL,
  CUSTOM2 char(100) default NULL,
  CUSTOM3 char(100) default NULL,
  CUSTOM4 char(100) default NULL,
  USERFIELD0 char(100) default NULL,
  USERFIELD1 char(100) default NULL,
  USERFIELD2 char(100) default NULL,
  USERFIELD3 char(100) default NULL,
  USERFIELD4 char(100) default NULL,
  USERFIELD5 char(100) default NULL,
  USERFIELD6 char(100) default NULL,
  USERFIELD7 char(100) default NULL,
  USERFIELD8 char(100) default NULL,
  USERFIELD9 char(100) default NULL,
  PRIMARY KEY (RECORDID),
  KEY ResID_ndx(RESOURCEID),
  KEY LName_ndx(LASTNAME),
  KEY Company_ndx(COMPANY)
);



#
# Table structure for table 'RecordIDS'
#

CREATE TABLE RecordIDS (
  RESOURCEID int(11) default NULL,
  EVENTID int(11) default NULL,
  TASKID int(11) default NULL,
  CONTACTID int(11) default NULL
);

INSERT INTO RecordIDS (RESOURCEID, EVENTID, TASKID, CONTACTID) VALUES (1, 1, 1, 1);


#
# Table structure for table 'Events'
#

CREATE TABLE Events (
  RECORDID int(11) NOT NULL default '0' auto_increment,
  STARTTIME  DATETIME NOT NULL,
  ENDTIME  DATETIME NOT NULL,
  RESOURCEID int(11) NOT NULL default '0',
  DESCRIPTION char(255) default NULL,
  NOTES char(255) default NULL,
  CATEGORY int(11) default NULL,
  ALLDAYEVENT enum('N','Y') NOT NULL default 'N',
  DINGPATH char(255) default NULL,
  ALARMSET enum('N','Y') NOT NULL default 'N',
  ALARMADVANCE int(11) default NULL,
  ALARMADVANCETYPE int(11) default NULL,
  SNOOZETIME  DATETIME,
  REPEATCODE int(11) default NULL,
  REPEATRANGEEND  DATETIME,
  CUSTOMINTERVAL int(11) default NULL,
  USERFIELD0 char(100) default NULL,
  USERFIELD1 char(100) default NULL,
  USERFIELD2 char(100) default NULL,
  USERFIELD3 char(100) default NULL,
  USERFIELD4 char(100) default NULL,
  USERFIELD5 char(100) default NULL,
  USERFIELD6 char(100) default NULL,
  USERFIELD7 char(100) default NULL,
  USERFIELD8 char(100) default NULL,
  USERFIELD9 char(100) default NULL,
  PRIMARY KEY (RECORDID),
  KEY rid_st_ndx(RESOURCEID,STARTTIME),
  KEY st_ndx(STARTTIME),
  KEY et_ndx(ENDTIME),
  KEY ResID_ndx(RESOURCEID)
);



#
# Table structure for table 'Resources'
#

CREATE TABLE Resources (
  RESOURCEID int(11) NOT NULL default '0',
  DESCRIPTION char(255) NOT NULL default '',
  NOTES char(255) default NULL,
  IMAGEINDEX int(11) default NULL,
  RESOURCEACTIVE enum('N','Y') NOT NULL default 'N',
  USERFIELD0 char(100) default NULL,
  USERFIELD1 char(100) default NULL,
  USERFIELD2 char(100) default NULL,
  USERFIELD3 char(100) default NULL,
  USERFIELD4 char(100) default NULL,
  USERFIELD5 char(100) default NULL,
  USERFIELD6 char(100) default NULL,
  USERFIELD7 char(100) default NULL,
  USERFIELD8 char(100) default NULL,
  USERFIELD9 char(100) default NULL,
  PRIMARY KEY (RESOURCEID),
  KEY ResID_ndx(RESOURCEID),
  KEY Descr_ndx(DESCRIPTION)
);

