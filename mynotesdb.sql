/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.17 : Database - mynotesdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mynotesdb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mynotesdb`;

/*Table structure for table `notes` */

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `noteid` int(11) NOT NULL AUTO_INCREMENT,
  `notesdata` longblob,
  `notesname` varchar(50) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedy` int(11) DEFAULT NULL,
  `updatedon` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'current_timestamp',
  `note_status` int(11) DEFAULT '1',
  PRIMARY KEY (`noteid`),
  KEY `fk_updateby_userid` (`updatedy`),
  KEY `fk_createdby_userid` (`createdby`),
  CONSTRAINT `fk_createdby_userid` FOREIGN KEY (`createdby`) REFERENCES `users` (`userid`),
  CONSTRAINT `fk_updateby_userid` FOREIGN KEY (`updatedy`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `notes` */

insert  into `notes`(`noteid`,`notesdata`,`notesname`,`createdby`,`createdon`,`updatedy`,`updatedon`,`note_status`) values 
(1,'My Sample data. This contains sample text.','MySample',1,'2019-10-06 01:17:54',NULL,NULL,NULL),
(2,'My sample Text note2','MyNote2',1,'2019-10-06 11:26:45',NULL,NULL,NULL),
(3,'My sample Text note3','MyNote3',2,'2019-10-06 11:26:45',NULL,'2019-10-06 18:43:27',NULL),
(4,'My sample Text note4','MyNote4',1,'2019-10-06 11:26:45',NULL,NULL,NULL),
(5,NULL,NULL,NULL,'2019-10-11 10:01:22',NULL,NULL,NULL),
(6,NULL,NULL,NULL,'2019-10-11 10:02:36',NULL,NULL,NULL),
(7,'testdaatat1','test1',3,'2019-10-11 10:03:20',NULL,NULL,NULL),
(8,'testdaatat2','test2',3,'2019-10-11 10:39:20',NULL,NULL,1);

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `permissionid` int(11) NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(10) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedon` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'current_timestamp',
  PRIMARY KEY (`permissionid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `permissions` */

insert  into `permissions`(`permissionid`,`permissionname`,`createdon`,`updatedon`) values 
(1,'Create','2019-10-06 00:35:05',NULL),
(2,'Read','2019-10-06 00:35:05',NULL),
(3,'Update','2019-10-06 00:35:05',NULL),
(4,'Delete','2019-10-06 00:35:05',NULL),
(5,'Share','2019-10-06 00:35:05',NULL);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(15) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedon` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'current_timestamp',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

insert  into `roles`(`roleid`,`rolename`,`createdon`,`updatedon`) values 
(1,'Owner','2019-10-06 00:33:45',NULL),
(2,'Contributor','2019-10-06 00:33:45',NULL),
(3,'Reader','2019-10-06 00:33:45',NULL);

/*Table structure for table `roles_permissions_association` */

DROP TABLE IF EXISTS `roles_permissions_association`;

CREATE TABLE `roles_permissions_association` (
  `rolepermid` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedon` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'current_timestamp',
  PRIMARY KEY (`rolepermid`),
  KEY `fk_roleid` (`roleid`),
  KEY `fk_permissionid` (`permissionid`),
  CONSTRAINT `fk_permissionid` FOREIGN KEY (`permissionid`) REFERENCES `permissions` (`permissionid`),
  CONSTRAINT `fk_roleid` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `roles_permissions_association` */

insert  into `roles_permissions_association`(`rolepermid`,`roleid`,`permissionid`,`createdon`,`updatedon`) values 
(1,1,1,'2019-10-06 00:41:15',NULL),
(2,1,2,'2019-10-06 00:41:15',NULL),
(3,1,3,'2019-10-06 00:41:15',NULL),
(4,1,4,'2019-10-06 00:41:15',NULL),
(5,1,5,'2019-10-06 00:41:15',NULL),
(8,2,2,'2019-10-06 00:54:13',NULL),
(9,2,3,'2019-10-06 00:54:13',NULL),
(11,3,2,'2019-10-06 00:59:06',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) DEFAULT NULL,
  `userpassword` longtext,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `emailid` varchar(200) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedon` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'current_timestamp',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`userid`,`username`,`userpassword`,`fname`,`lname`,`emailid`,`createdon`,`updatedon`) values 
(1,'user1','92b1937e60f17fd8d0889349554638ee4801bd06f7d649bc16af3f41dcd605d35903b19acbb1f9439810883ec963daba06aca80637ef71','User','Main','user1@gmail.com','2019-10-06 01:12:48','2019-10-11 14:40:32'),
(2,'user2','14f1133149024a7b795e85b1bd07cdfe62a4be5dc11ffdec1c079362b92df65c66241ec346d52425469f881bb575f318d44559afb608319','User','Contributor','user2@gmail.com','2019-10-06 01:12:48','2019-10-11 14:41:01'),
(3,'user3','5650eae5890a1c5f5d5bf4265b81c13ea98a20d2a0e3f040c872a894ef2884a43df87fe6f733994ec27ea6d5ebb014c2bec139ac02ca8d2','User','Reader','user3@gmail.com','2019-10-06 01:12:48','2019-10-11 14:41:24');

/*Table structure for table `users_notes_roles_permissions_assoc` */

DROP TABLE IF EXISTS `users_notes_roles_permissions_assoc`;

CREATE TABLE `users_notes_roles_permissions_assoc` (
  `userrolepermid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `noteid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `createdon` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedon` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'current_timestamp',
  PRIMARY KEY (`userrolepermid`),
  KEY `fk_userid` (`userid`),
  KEY `fk_noteid` (`noteid`),
  KEY `fk_rolepermid` (`roleid`),
  CONSTRAINT `fk_noteid` FOREIGN KEY (`noteid`) REFERENCES `notes` (`noteid`),
  CONSTRAINT `fk_rolepermid` FOREIGN KEY (`roleid`) REFERENCES `roles` (`roleid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `users_notes_roles_permissions_assoc` */

insert  into `users_notes_roles_permissions_assoc`(`userrolepermid`,`userid`,`noteid`,`roleid`,`createdon`,`updatedon`) values 
(1,1,1,1,'2019-10-06 19:24:53',NULL),
(2,2,1,2,'2019-10-06 19:30:25',NULL),
(3,3,1,3,'2019-10-06 19:30:25',NULL),
(4,1,2,1,'2019-10-06 19:30:59',NULL),
(5,2,2,3,'2019-10-06 19:30:59','2019-10-07 21:11:03'),
(6,2,3,1,'2019-10-07 21:19:51',NULL),
(7,1,3,2,'2019-10-07 21:23:25',NULL);

/* Procedure structure for procedure `api_createnote` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_createnote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_createnote`(
    in in_notename varchar(100),
    in in_notedata longblob,
    in in_createdby int,
    out out_noteid int,
    out out_notename varchar(100),
    out out_notesdata longblob,
    out out_createddate datetime
    )
    COMMENT 'Creates a note. Input:- Notename,NoteData,CreatedBy OutPut:- NoteId,NoteName,NoteData. Created By :- Gaytri Suyambu. CreatedOn :- 08-Oct-2019'
BEGIN
		if not exists(select 1 from notes where `notesname`=in_notename and `createdby`=in_createdby) then
		begin
			-- select in_notename,in_notedata,in_createdby;
			insert into notes(`notesname`,`notesdata`,`createdby`)
			values
			(in_notename,in_notedata,in_createdby);
			
			SELECT 
			`noteid`,`notesname`,`notesdata`,`createdon`
			into
			 out_noteid,out_notename,out_notesdata,out_createddate
			FROM notes WHERE `notesname`=in_notename AND `createdby`=in_createdby;
		end;
		else
		begin
			set out_noteid=-1;/*Returning -1 to indicate that the note with the same name already exists*/
		end;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_createuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_createuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_createuser`(
	in in_username varchar(150),
	IN in_userpassword LONGTEXT,
	in in_fname varchar(100),
	in in_lname varchar(100),
	in in_emailid varchar(200),
	out out_userid int
    )
    COMMENT 'Creates a user. Created by:- Gayatri Suyambu Created Date:- 08-Oct-2019'
BEGIN
		if not exists(select 1 from `users` where `username`=in_username and in_emailid=`emailid`) then
		begin
			insert into `users`(`username`,`userpassword`,`fname`,`lname`,`emailid`)
			values
			(in_username,in_userpassword,in_fname,in_lname,in_emailid);
			
			set out_userid=(select last_insert_id());
		end;
		else
		begin
			SET out_userid=-1;
		end;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_deletenote` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_deletenote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_deletenote`(
	IN in_noteid INT,
	in in_userid int,
	in out_deletestatus int
    )
    COMMENT 'Soft Deleted a note. Input:- NoteId,UserId OutPut:-out_deletestatus  Created By :- Gayatri Suyambu. CreatedOn :- 08-Oct-2019'
BEGIN
		if exists(select 1 from notes where noteid=in_noteid) then
		begin
			update notes
			set note_status=0,`updatedy`=in_userid
			where noteid=in_noteid;
			
			set out_deletestatus=1;
		end;
		else
		begin
			SET out_deletestatus=-1;
		end;
		end if;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_getcreatednotes` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_getcreatednotes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_getcreatednotes`(in userid int)
    COMMENT 'Gets the notes created by a user. Input:- INT userid, Output:- NoteId,NoteName,NoteData. Created By :- Gayatri Suyambu. Created On :- 07-Oct-2019'
BEGIN
		SELECT noteid as noteId,notesname as noteName,notesdata as noteData FROM
		notes
		WHERE createdby=userid
		ORDER BY IFNULL(createdon,updatedon) DESC;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_getnote` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_getnote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_getnote`(
	in in_noteid int,
	out out_noteid int,
	out out_notename varchar(100),
	out out_notedata longblob,
	out out_createddate datetime,
	out out_updatedate datetime
    )
    COMMENT 'Gets a note. Input:- NoteId OutPut:-out_noteid,out_notename,out_notedata,out_createddate,out_updatedate  Created By :- Gayatri Suyambu. CreatedOn :- 08-Oct-2019'
BEGIN
		
		SELECT 
		`noteid`,`notesname`,`notesdata`,`createdon`,`updatedon`
		INTO
		 out_noteid,out_notename,out_notedata,out_createddate,out_updatedate
		FROM notes WHERE noteid=in_noteid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_getnotesshared` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_getnotesshared` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_getnotesshared`(IN userid INT)
    COMMENT 'Gets the notes shared with a user. Input:- INT userid, Output:- NoteId,NoteName,NoteData. Created By :- Gayatri Suyambu. Created On :- 07-Oct-2019'
BEGIN
		SELECT  DISTINCT n.noteid  AS noteId,n.notesname AS noteName,n.notesdata AS noteData FROM 
		notes n
		INNER JOIN
		users_notes_roles_permissions_assoc unrpa ON n.noteid=unrpa.noteid
		WHERE n.createdby!=userid AND unrpa.roleid IN (2,3);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_getsharednotes` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_getsharednotes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_getsharednotes`(in userid int)
    COMMENT 'Gets the notes shared by a user. Input:- INT userid, Output:- NoteId,NoteName,NoteData. Created By :- Gayatri Suyambu. Created On :- 07-Oct-2019'
BEGIN
		SELECT DISTINCT n.noteid  AS noteId,n.notesname as noteName,n.notesdata as noteData FROM 
		notes n
		INNER JOIN
		users_notes_roles_permissions_assoc unrpa ON n.noteid=unrpa.noteid
		WHERE n.createdby=userid AND unrpa.roleid IN (2,3);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_getuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_getuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_getuser`(
	in in_username varchar(150),
	in in_emailid varchar(200),
	out out_userid int,
	out out_userpassword longtext
    )
    COMMENT 'Gets deatils for validating a user. Created By:- Gayatri Suyambu Created Date:- 08-Oct-2019'
BEGIN
		select `userid`,`userpassword`
		into 
		out_userid,out_userpassword
		from
		`users`
		where
		`username`=in_username
		and
		`emailid`=in_emailid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_sharenote` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_sharenote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_sharenote`(
	in in_noteid int,
	in in_roleid int,
	in in_userid int,
	out out_sharestatus int
    )
    COMMENT 'Shares a note. Input:- NoteId,RoleId,UserId OutPut:-out_sharestatus  Created By :- Gayatri Suyambu. CreatedOn :- 08-Oct-2019'
BEGIN
		insert into `users_notes_roles_permissions_assoc`(`userid`,`noteid`,`roleid`)
		values
		(in_userid,in_noteid,in_roleid);
		
		set out_sharestatus=1;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `api_updatenote` */

/*!50003 DROP PROCEDURE IF EXISTS  `api_updatenote` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `api_updatenote`(
	in in_noteid int,
	IN in_notename VARCHAR(100),
	IN in_notedata LONGBLOB,
	IN in_updatedby INT,
	OUT out_noteid INT,
	OUT out_notename VARCHAR(100),
	OUT out_notesdata LONGBLOB,
	out out_createdon datetime,
	out out_updateddate datetime,
	out out_updatestatus int
    )
    COMMENT 'Updates a note. Input:- NoteId,Notename,NoteData,UpdateBy OutPut:- NoteId,NoteName,NoteData. Created By :- Gaytri Suyambu. CreatedOn :- 08-Oct-2019'
BEGIN
		if exists(select 1 from notes where noteid=in_noteid) then
		begin
			UPDATE `notes`
			SET
			`notesdata`=in_notedata,
			`notesname`=in_notename,
			`updatedy`=in_updatedby
			WHERE noteid=in_noteid;
			
			SELECT 
			`noteid`,`notesname`,`notesdata`,`createdon`,`updatedon`
			INTO
			 out_noteid,out_notename,out_notesdata,out_createdon,out_updateddate
			FROM notes WHERE noteid=in_noteid;
			
			set out_updatestatus=1;
		end;
		else
		begin
			set out_updatestatus=-1;
		end;
		end if;
		
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
