/*
Navicat SQL Server Data Transfer
ss
Source Server         : 117.34.105.239
Source Server Version : 120000
Source Host           : 117.34.105.239:1433
Source Database       : pps
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 120000
File Encoding         : 65001

Date: 2019-02-14 17:04:36
*/


-- ----------------------------
-- Table structure for ACT_EVT_LOG
-- ----------------------------
DROP TABLE [dbo].[ACT_EVT_LOG]
GO
CREATE TABLE [dbo].[ACT_EVT_LOG] (
[LOG_NR_] numeric(19) NOT NULL IDENTITY(1,1) ,
[TYPE_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[TIME_STAMP_] datetime NOT NULL ,
[USER_ID_] nvarchar(255) NULL ,
[DATA_] varbinary(MAX) NULL ,
[LOCK_OWNER_] nvarchar(255) NULL ,
[LOCK_TIME_] datetime NULL ,
[IS_PROCESSED_] tinyint NULL DEFAULT ((0)) 
)


GO

-- ----------------------------
-- Table structure for ACT_GE_BYTEARRAY
-- ----------------------------
DROP TABLE [dbo].[ACT_GE_BYTEARRAY]
GO
CREATE TABLE [dbo].[ACT_GE_BYTEARRAY] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[NAME_] nvarchar(255) NULL ,
[DEPLOYMENT_ID_] nvarchar(64) NULL ,
[BYTES_] varbinary(MAX) NULL ,
[GENERATED_] tinyint NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_GE_PROPERTY
-- ----------------------------
DROP TABLE [dbo].[ACT_GE_PROPERTY]
GO
CREATE TABLE [dbo].[ACT_GE_PROPERTY] (
[NAME_] nvarchar(64) NOT NULL ,
[VALUE_] nvarchar(300) NULL ,
[REV_] int NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_HI_ACTINST
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_ACTINST]
GO
CREATE TABLE [dbo].[ACT_HI_ACTINST] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_DEF_ID_] nvarchar(64) NOT NULL ,
[PROC_INST_ID_] nvarchar(64) NOT NULL ,
[EXECUTION_ID_] nvarchar(64) NOT NULL ,
[ACT_ID_] nvarchar(255) NOT NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[CALL_PROC_INST_ID_] nvarchar(64) NULL ,
[ACT_NAME_] nvarchar(255) NULL ,
[ACT_TYPE_] nvarchar(255) NOT NULL ,
[ASSIGNEE_] nvarchar(255) NULL ,
[START_TIME_] datetime NOT NULL ,
[END_TIME_] datetime NULL ,
[DURATION_] numeric(19) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Table structure for ACT_HI_ATTACHMENT
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_ATTACHMENT]
GO
CREATE TABLE [dbo].[ACT_HI_ATTACHMENT] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[USER_ID_] nvarchar(255) NULL ,
[NAME_] nvarchar(255) NULL ,
[DESCRIPTION_] nvarchar(4000) NULL ,
[TYPE_] nvarchar(255) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[URL_] nvarchar(4000) NULL ,
[CONTENT_ID_] nvarchar(64) NULL ,
[TIME_] datetime NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_HI_COMMENT
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_COMMENT]
GO
CREATE TABLE [dbo].[ACT_HI_COMMENT] (
[ID_] nvarchar(64) NOT NULL ,
[TYPE_] nvarchar(255) NULL ,
[TIME_] datetime NOT NULL ,
[USER_ID_] nvarchar(255) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[ACTION_] nvarchar(255) NULL ,
[MESSAGE_] nvarchar(4000) NULL ,
[FULL_MSG_] varbinary(MAX) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_HI_DETAIL
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_DETAIL]
GO
CREATE TABLE [dbo].[ACT_HI_DETAIL] (
[ID_] nvarchar(64) NOT NULL ,
[TYPE_] nvarchar(255) NOT NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[ACT_INST_ID_] nvarchar(64) NULL ,
[NAME_] nvarchar(255) NOT NULL ,
[VAR_TYPE_] nvarchar(255) NULL ,
[REV_] int NULL ,
[TIME_] datetime NOT NULL ,
[BYTEARRAY_ID_] nvarchar(64) NULL ,
[DOUBLE_] float(53) NULL ,
[LONG_] numeric(19) NULL ,
[TEXT_] nvarchar(4000) NULL ,
[TEXT2_] nvarchar(4000) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_HI_IDENTITYLINK
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_IDENTITYLINK]
GO
CREATE TABLE [dbo].[ACT_HI_IDENTITYLINK] (
[ID_] nvarchar(64) NOT NULL ,
[GROUP_ID_] nvarchar(255) NULL ,
[TYPE_] nvarchar(255) NULL ,
[USER_ID_] nvarchar(255) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_HI_PROCINST
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_PROCINST]
GO
CREATE TABLE [dbo].[ACT_HI_PROCINST] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_INST_ID_] nvarchar(64) NOT NULL ,
[BUSINESS_KEY_] nvarchar(255) NULL ,
[PROC_DEF_ID_] nvarchar(64) NOT NULL ,
[START_TIME_] datetime NOT NULL ,
[END_TIME_] datetime NULL ,
[DURATION_] numeric(19) NULL ,
[START_USER_ID_] nvarchar(255) NULL ,
[START_ACT_ID_] nvarchar(255) NULL ,
[END_ACT_ID_] nvarchar(255) NULL ,
[SUPER_PROCESS_INSTANCE_ID_] nvarchar(64) NULL ,
[DELETE_REASON_] nvarchar(4000) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' ,
[NAME_] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_HI_TASKINST
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_TASKINST]
GO
CREATE TABLE [dbo].[ACT_HI_TASKINST] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[TASK_DEF_KEY_] nvarchar(255) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[NAME_] nvarchar(255) NULL ,
[PARENT_TASK_ID_] nvarchar(64) NULL ,
[DESCRIPTION_] nvarchar(4000) NULL ,
[OWNER_] nvarchar(255) NULL ,
[ASSIGNEE_] nvarchar(255) NULL ,
[START_TIME_] datetime NOT NULL ,
[CLAIM_TIME_] datetime NULL ,
[END_TIME_] datetime NULL ,
[DURATION_] numeric(19) NULL ,
[DELETE_REASON_] nvarchar(4000) NULL ,
[PRIORITY_] int NULL ,
[DUE_DATE_] datetime NULL ,
[FORM_KEY_] nvarchar(255) NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Table structure for ACT_HI_VARINST
-- ----------------------------
DROP TABLE [dbo].[ACT_HI_VARINST]
GO
CREATE TABLE [dbo].[ACT_HI_VARINST] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[NAME_] nvarchar(255) NOT NULL ,
[VAR_TYPE_] nvarchar(100) NULL ,
[REV_] int NULL ,
[BYTEARRAY_ID_] nvarchar(64) NULL ,
[DOUBLE_] float(53) NULL ,
[LONG_] numeric(19) NULL ,
[TEXT_] nvarchar(4000) NULL ,
[TEXT2_] nvarchar(4000) NULL ,
[CREATE_TIME_] datetime NULL ,
[LAST_UPDATED_TIME_] datetime NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_ID_GROUP
-- ----------------------------
DROP TABLE [dbo].[ACT_ID_GROUP]
GO
CREATE TABLE [dbo].[ACT_ID_GROUP] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[NAME_] nvarchar(255) NULL ,
[TYPE_] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_ID_INFO
-- ----------------------------
DROP TABLE [dbo].[ACT_ID_INFO]
GO
CREATE TABLE [dbo].[ACT_ID_INFO] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[USER_ID_] nvarchar(64) NULL ,
[TYPE_] nvarchar(64) NULL ,
[KEY_] nvarchar(255) NULL ,
[VALUE_] nvarchar(255) NULL ,
[PASSWORD_] varbinary(MAX) NULL ,
[PARENT_ID_] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_ID_MEMBERSHIP
-- ----------------------------
DROP TABLE [dbo].[ACT_ID_MEMBERSHIP]
GO
CREATE TABLE [dbo].[ACT_ID_MEMBERSHIP] (
[USER_ID_] nvarchar(64) NOT NULL ,
[GROUP_ID_] nvarchar(64) NOT NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_ID_USER
-- ----------------------------
DROP TABLE [dbo].[ACT_ID_USER]
GO
CREATE TABLE [dbo].[ACT_ID_USER] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[FIRST_] nvarchar(255) NULL ,
[LAST_] nvarchar(255) NULL ,
[EMAIL_] nvarchar(255) NULL ,
[PWD_] nvarchar(255) NULL ,
[PICTURE_ID_] nvarchar(64) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_PROCDEF_INFO
-- ----------------------------
DROP TABLE [dbo].[ACT_PROCDEF_INFO]
GO
CREATE TABLE [dbo].[ACT_PROCDEF_INFO] (
[ID_] nvarchar(64) NOT NULL ,
[PROC_DEF_ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[INFO_JSON_ID_] nvarchar(64) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_RE_DEPLOYMENT
-- ----------------------------
DROP TABLE [dbo].[ACT_RE_DEPLOYMENT]
GO
CREATE TABLE [dbo].[ACT_RE_DEPLOYMENT] (
[ID_] nvarchar(64) NOT NULL ,
[NAME_] nvarchar(255) NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' ,
[DEPLOY_TIME_] datetime NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_RE_MODEL
-- ----------------------------
DROP TABLE [dbo].[ACT_RE_MODEL]
GO
CREATE TABLE [dbo].[ACT_RE_MODEL] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[NAME_] nvarchar(255) NULL ,
[KEY_] nvarchar(255) NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[CREATE_TIME_] datetime NULL ,
[LAST_UPDATE_TIME_] datetime NULL ,
[VERSION_] int NULL ,
[META_INFO_] nvarchar(4000) NULL ,
[DEPLOYMENT_ID_] nvarchar(64) NULL ,
[EDITOR_SOURCE_VALUE_ID_] nvarchar(64) NULL ,
[EDITOR_SOURCE_EXTRA_VALUE_ID_] nvarchar(64) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Table structure for ACT_RE_PROCDEF
-- ----------------------------
DROP TABLE [dbo].[ACT_RE_PROCDEF]
GO
CREATE TABLE [dbo].[ACT_RE_PROCDEF] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[NAME_] nvarchar(255) NULL ,
[KEY_] nvarchar(255) NOT NULL ,
[VERSION_] int NOT NULL ,
[DEPLOYMENT_ID_] nvarchar(64) NULL ,
[RESOURCE_NAME_] nvarchar(4000) NULL ,
[DGRM_RESOURCE_NAME_] nvarchar(4000) NULL ,
[DESCRIPTION_] nvarchar(4000) NULL ,
[HAS_START_FORM_KEY_] tinyint NULL ,
[HAS_GRAPHICAL_NOTATION_] tinyint NULL ,
[SUSPENSION_STATE_] tinyint NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Table structure for ACT_RU_EVENT_SUBSCR
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_EVENT_SUBSCR]
GO
CREATE TABLE [dbo].[ACT_RU_EVENT_SUBSCR] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[EVENT_TYPE_] nvarchar(255) NOT NULL ,
[EVENT_NAME_] nvarchar(255) NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[ACTIVITY_ID_] nvarchar(64) NULL ,
[CONFIGURATION_] nvarchar(255) NULL ,
[CREATED_] datetime NOT NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Table structure for ACT_RU_EXECUTION
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_EXECUTION]
GO
CREATE TABLE [dbo].[ACT_RU_EXECUTION] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[BUSINESS_KEY_] nvarchar(255) NULL ,
[PARENT_ID_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[SUPER_EXEC_] nvarchar(64) NULL ,
[ACT_ID_] nvarchar(255) NULL ,
[IS_ACTIVE_] tinyint NULL ,
[IS_CONCURRENT_] tinyint NULL ,
[IS_SCOPE_] tinyint NULL ,
[IS_EVENT_SCOPE_] tinyint NULL ,
[SUSPENSION_STATE_] tinyint NULL ,
[CACHED_ENT_STATE_] int NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' ,
[NAME_] nvarchar(255) NULL ,
[LOCK_TIME_] datetime NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_RU_IDENTITYLINK
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_IDENTITYLINK]
GO
CREATE TABLE [dbo].[ACT_RU_IDENTITYLINK] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[GROUP_ID_] nvarchar(255) NULL ,
[TYPE_] nvarchar(255) NULL ,
[USER_ID_] nvarchar(255) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_RU_JOB
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_JOB]
GO
CREATE TABLE [dbo].[ACT_RU_JOB] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[TYPE_] nvarchar(255) NOT NULL ,
[LOCK_EXP_TIME_] datetime NULL ,
[LOCK_OWNER_] nvarchar(255) NULL ,
[EXCLUSIVE_] bit NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[PROCESS_INSTANCE_ID_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[RETRIES_] int NULL ,
[EXCEPTION_STACK_ID_] nvarchar(64) NULL ,
[EXCEPTION_MSG_] nvarchar(4000) NULL ,
[DUEDATE_] datetime NULL ,
[REPEAT_] nvarchar(255) NULL ,
[HANDLER_TYPE_] nvarchar(255) NULL ,
[HANDLER_CFG_] nvarchar(4000) NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' 
)


GO

-- ----------------------------
-- Table structure for ACT_RU_TASK
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_TASK]
GO
CREATE TABLE [dbo].[ACT_RU_TASK] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[PROC_DEF_ID_] nvarchar(64) NULL ,
[NAME_] nvarchar(255) NULL ,
[PARENT_TASK_ID_] nvarchar(64) NULL ,
[DESCRIPTION_] nvarchar(4000) NULL ,
[TASK_DEF_KEY_] nvarchar(255) NULL ,
[OWNER_] nvarchar(255) NULL ,
[ASSIGNEE_] nvarchar(255) NULL ,
[DELEGATION_] nvarchar(64) NULL ,
[PRIORITY_] int NULL ,
[CREATE_TIME_] datetime NULL ,
[DUE_DATE_] datetime NULL ,
[CATEGORY_] nvarchar(255) NULL ,
[SUSPENSION_STATE_] int NULL ,
[TENANT_ID_] nvarchar(255) NULL DEFAULT '' ,
[FORM_KEY_] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Table structure for ACT_RU_VARIABLE
-- ----------------------------
DROP TABLE [dbo].[ACT_RU_VARIABLE]
GO
CREATE TABLE [dbo].[ACT_RU_VARIABLE] (
[ID_] nvarchar(64) NOT NULL ,
[REV_] int NULL ,
[TYPE_] nvarchar(255) NOT NULL ,
[NAME_] nvarchar(255) NOT NULL ,
[EXECUTION_ID_] nvarchar(64) NULL ,
[PROC_INST_ID_] nvarchar(64) NULL ,
[TASK_ID_] nvarchar(64) NULL ,
[BYTEARRAY_ID_] nvarchar(64) NULL ,
[DOUBLE_] float(53) NULL ,
[LONG_] numeric(19) NULL ,
[TEXT_] nvarchar(4000) NULL ,
[TEXT2_] nvarchar(4000) NULL 
)


GO

-- ----------------------------
-- Table structure for bhz_mixingMachine
-- ----------------------------
DROP TABLE [dbo].[bhz_mixingMachine]
GO
CREATE TABLE [dbo].[bhz_mixingMachine] (
[id] bigint NOT NULL ,
[orgId] bigint NULL ,
[projectId] bigint NULL ,
[projectCode] varchar(255) NULL ,
[clientId] bigint NULL ,
[clientName] varchar(255) NULL ,
[type] int NULL ,
[clientCode] varchar(255) NULL ,
[area] varchar(255) NULL ,
[code1] varchar(255) NULL ,
[code2] varchar(255) NULL ,
[code3] varchar(255) NULL ,
[remark] varchar(255) NULL ,
[fileName] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机储存表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机储存表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标段Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标段Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'projectId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'项目Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'projectId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'项目Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'projectId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'projectCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'项目编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'projectCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'项目编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'projectCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'clientId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机编号(和拌合机Id相同）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'clientId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机编号(和拌合机Id相同）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'clientId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'clientName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'clientName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'clientName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机类型(混凝土、水稳、····)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机类型(混凝土、水稳、····)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'clientCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'clientCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'clientCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'area')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'安装位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'area'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'安装位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'area'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'code1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'外接平台拌合机对应code1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'code1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'外接平台拌合机对应code1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'code1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'code2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'外接平台拌合机对应code2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'code2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'外接平台拌合机对应code2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'code2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'code3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'外接平台拌合机对应code3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'code3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'外接平台拌合机对应code3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'code3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'bhz_mixingMachine', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'bhz_mixingMachine'
, @level2type = 'COLUMN', @level2name = N'remark'
GO

-- ----------------------------
-- Table structure for imp_alarm_deal
-- ----------------------------
DROP TABLE [dbo].[imp_alarm_deal]
GO
CREATE TABLE [dbo].[imp_alarm_deal] (
[id] bigint NOT NULL ,
[msgId] bigint NULL DEFAULT NULL ,
[suggestion] varchar(600) NULL DEFAULT NULL ,
[remark] varchar(600) NULL DEFAULT NULL ,
[dealTime] datetime2(7) NULL DEFAULT NULL ,
[dealPerson] varchar(64) NULL DEFAULT NULL ,
[status] int NULL DEFAULT NULL ,
[annexIds] varchar(255) NULL DEFAULT NULL ,
[sendFlag] int NULL DEFAULT NULL ,
[retuanKey] varchar(255) NULL DEFAULT NULL ,
[dataId] bigint NULL DEFAULT NULL ,
[msgType] int NULL DEFAULT NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预警处理表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预警处理表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'msgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预警消息ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'msgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预警消息ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'msgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'suggestion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'suggestion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理意见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'suggestion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'dealTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'dealTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'dealTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'dealPerson')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'dealPerson'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'dealPerson'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'annexIds')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'附件ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'annexIds'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'附件ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'annexIds'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'sendFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发送状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'sendFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发送状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'sendFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'retuanKey')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发送返回标记值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'retuanKey'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发送返回标记值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'retuanKey'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'dataId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'原始数据ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'dataId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'原始数据ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'dataId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_alarm_deal', 
'COLUMN', N'msgType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预警类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'msgType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预警类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_alarm_deal'
, @level2type = 'COLUMN', @level2name = N'msgType'
GO

-- ----------------------------
-- Table structure for imp_annex
-- ----------------------------
DROP TABLE [dbo].[imp_annex]
GO
CREATE TABLE [dbo].[imp_annex] (
[id] bigint NULL ,
[fileName] varchar(128) NULL DEFAULT NULL ,
[path] varchar(255) NULL DEFAULT NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_annex', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'附件信息表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_annex'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'附件信息表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_annex'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_annex', 
'COLUMN', N'fileName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'附件名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_annex'
, @level2type = 'COLUMN', @level2name = N'fileName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'附件名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_annex'
, @level2type = 'COLUMN', @level2name = N'fileName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_annex', 
'COLUMN', N'path')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'附件路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_annex'
, @level2type = 'COLUMN', @level2name = N'path'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'附件路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_annex'
, @level2type = 'COLUMN', @level2name = N'path'
GO

-- ----------------------------
-- Table structure for imp_asphalt_formula
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_formula]
GO
CREATE TABLE [dbo].[imp_asphalt_formula] (
[id] bigint NOT NULL ,
[asphaltNo] varchar(100) NULL ,
[name] varchar(100) NULL ,
[pavingLevel] bigint NULL ,
[standardLevel] bigint NULL ,
[planOutput] decimal(12,2) NULL ,
[additionalOutput] decimal(12,2) NULL ,
[status] int NULL ,
[asphaltId] bigint NULL ,
[remarks] varchar(300) NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[dataVersion] int NULL ,
[isVisible] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青配方表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青配方表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'asphaltNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'asphaltNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'asphaltNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'pavingLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'摊铺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'pavingLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摊铺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'pavingLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'standardLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'国标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'standardLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'国标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'standardLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'planOutput')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'计划产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'planOutput'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'计划产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'planOutput'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'additionalOutput')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'附加产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'additionalOutput'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'附加产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'additionalOutput'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方状态--0启用-1禁用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方状态--0启用-1禁用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'asphaltId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'remarks')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'remarks'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'remarks'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'dataVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_formula', 
'COLUMN', N'isVisible')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见-1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'isVisible'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见-1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_formula'
, @level2type = 'COLUMN', @level2name = N'isVisible'
GO

-- ----------------------------
-- Table structure for imp_asphalt_info
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_info]
GO
CREATE TABLE [dbo].[imp_asphalt_info] (
[id] bigint NOT NULL ,
[name] varchar(150) NULL ,
[contact] varchar(150) NULL ,
[phone] varchar(20) NULL ,
[installTime] datetime NULL ,
[address] varchar(500) NULL ,
[coordinate] varchar(150) NULL ,
[type] varchar(150) NULL ,
[aggregateNum] int NULL ,
[powderNum] int NULL ,
[aggregateName] varchar(1500) NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[remarks] varchar(500) NULL ,
[orgId] bigint NULL ,
[isOpen] int NULL ,
[warningPhone] varchar(255) NULL ,
[outMouthTemp] int NULL ,
[asphaltTemp] int NULL ,
[stoneTemp] int NULL ,
[cardMark] varchar(255) NULL ,
[mixingTemp] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青站基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青站基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'contact')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'contact'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'contact'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'installTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'安装时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'installTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'安装时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'installTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'address')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'address'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'address'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'coordinate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'coordinate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'coordinate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'安装类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'安装类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'aggregateNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料仓数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'aggregateNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料仓数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'aggregateNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'powderNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料仓数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'powderNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料仓数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'powderNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'aggregateName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料仓名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'aggregateName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料仓名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'aggregateName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'remarks')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'remarks'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'remarks'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构--隶属标段'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构--隶属标段'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'isOpen')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'统计预警开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'isOpen'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'统计预警开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'isOpen'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'warningPhone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'统计预警电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'warningPhone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'统计预警电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'warningPhone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'outMouthTemp')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出料口溫度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'outMouthTemp'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出料口溫度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'outMouthTemp'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'asphaltTemp')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'asphaltTemp'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'asphaltTemp'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'stoneTemp')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'石料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'stoneTemp'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'石料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'stoneTemp'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'cardMark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'射频卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'cardMark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'射频卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'cardMark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_info', 
'COLUMN', N'mixingTemp')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'mixingTemp'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_info'
, @level2type = 'COLUMN', @level2name = N'mixingTemp'
GO

-- ----------------------------
-- Table structure for imp_asphalt_metadata
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_metadata]
GO
CREATE TABLE [dbo].[imp_asphalt_metadata] (
[id] bigint NOT NULL ,
[time] datetime NULL ,
[mixingTime] bigint NULL ,
[asphaltId] bigint NULL ,
[formulaId] bigint NULL ,
[formulaCode] varchar(100) NULL ,
[oilStoneProportion] decimal(6,2) NULL ,
[asphalt] decimal(12,2) NULL ,
[temperature] decimal(6,2) NULL ,
[weight] decimal(12,2) NULL ,
[g1] decimal(12,2) NULL ,
[g2] decimal(12,2) NULL ,
[g3] decimal(12,2) NULL ,
[g4] decimal(12,2) NULL ,
[g5] decimal(12,2) NULL ,
[g6] decimal(12,2) NULL ,
[g7] decimal(12,2) NULL ,
[g8] decimal(12,2) NULL ,
[g9] decimal(12,2) NULL ,
[g10] decimal(12,2) NULL ,
[f1] decimal(12,2) NULL ,
[f2] decimal(12,2) NULL ,
[f3] decimal(12,2) NULL ,
[f4] decimal(12,2) NULL ,
[f5] decimal(12,2) NULL ,
[warnLevel] int NULL ,
[asphaltTemperature] decimal(6,2) NULL ,
[aggregateTemperature] decimal(6,2) NULL ,
[createTime] datetime NULL ,
[batchCode] varchar(150) NULL ,
[tempLevel] int NULL ,
[gradationLevel] int NULL ,
[oilStoneLevel] int NULL ,
[aggregateWeight] decimal(12,2) NULL ,
[startTime] datetime NULL ,
[endTime] datetime NULL ,
[isPass] int NULL ,
[asphaltTempLevel] int NULL ,
[aggTempLevel] int NULL ,
[mixingTemperature] decimal(6,2) NULL ,
[mixingTempLevel] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青元数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青元数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'mixingTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'mixingTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'mixingTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'asphaltId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'formulaCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方编码值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'formulaCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方编码值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'formulaCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'oilStoneProportion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'油石比'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'oilStoneProportion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'油石比'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'oilStoneProportion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'asphalt')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'asphalt'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'asphalt'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'temperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'temperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'temperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'weight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'weight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'weight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g6')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g6'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g6'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g7')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料7'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g7'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料7'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g7'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g8')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料8'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g8'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料8'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g8'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g9')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料9'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g9'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料9'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g9'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'g10')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料10'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g10'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料10'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'g10'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'f1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'f2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'f3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'f4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'f5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'f5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'warnLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'warnLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'warnLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'asphaltTemperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'asphaltTemperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'asphaltTemperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'aggregateTemperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'集料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'aggregateTemperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'集料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'aggregateTemperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上传时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上传时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'batchCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'批次编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'batchCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'批次编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'batchCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'tempLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'温度告警级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'tempLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'温度告警级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'tempLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'gradationLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'级配超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'gradationLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'级配超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'gradationLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'oilStoneLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'油石比超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'oilStoneLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'油石比超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'oilStoneLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'aggregateWeight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'aggregateWeight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'aggregateWeight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'startTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'startTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'startTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'endTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'endTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'endTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'isPass')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格 1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'isPass'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格 1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'isPass'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'asphaltTempLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'asphaltTempLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'asphaltTempLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'aggTempLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'aggTempLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'aggTempLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'mixingTemperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'mixingTemperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'mixingTemperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata', 
'COLUMN', N'mixingTempLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合温度级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'mixingTempLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合温度级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata'
, @level2type = 'COLUMN', @level2name = N'mixingTempLevel'
GO

-- ----------------------------
-- Table structure for imp_asphalt_metadata_result
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_metadata_result]
GO
CREATE TABLE [dbo].[imp_asphalt_metadata_result] (
[id] bigint NOT NULL ,
[asphaltId] bigint NULL ,
[formulaId] bigint NULL ,
[formulaCode] varchar(100) NULL ,
[oilStoneProportion] decimal(6,2) NULL ,
[asphalt] decimal(12,2) NULL ,
[weight] decimal(12,2) NULL ,
[sieve1] decimal(12,2) NULL ,
[sieve2] decimal(12,2) NULL ,
[sieve3] decimal(12,2) NULL ,
[sieve4] decimal(12,2) NULL ,
[sieve5] decimal(12,2) NULL ,
[sieve6] decimal(12,2) NULL ,
[sieve7] decimal(12,2) NULL ,
[sieve8] decimal(12,2) NULL ,
[sieve9] decimal(12,2) NULL ,
[sieve10] decimal(12,2) NULL ,
[sieve11] decimal(12,2) NULL ,
[sieve12] decimal(12,2) NULL ,
[sieve13] decimal(12,2) NULL ,
[batchCode] varchar(150) NULL ,
[tempLevel] int NULL ,
[gradationLevel] int NULL ,
[oilStoneLevel] int NULL ,
[aggregateWeight] decimal(12,2) NULL ,
[isPass] int NULL ,
[dataId] bigint NULL ,
[excessMsg] varchar(1500) NULL ,
[sieve1State] int NULL ,
[sieve2State] int NULL ,
[sieve3State] int NULL ,
[sieve4State] int NULL ,
[sieve5State] int NULL ,
[sieve6State] int NULL ,
[sieve7State] int NULL ,
[sieve8State] int NULL ,
[sieve9State] int NULL ,
[sieve10State] int NULL ,
[sieve11State] int NULL ,
[sieve12State] int NULL ,
[sieve13State] int NULL ,
[time] datetime NULL ,
[temperature] decimal(6,2) NULL ,
[sieveVersion] int NULL ,
[sieve1Msg] varchar(150) NULL ,
[sieve2Msg] varchar(150) NULL ,
[sieve3Msg] varchar(150) NULL ,
[sieve4Msg] varchar(150) NULL ,
[sieve5Msg] varchar(150) NULL ,
[sieve6Msg] varchar(150) NULL ,
[sieve7Msg] varchar(150) NULL ,
[sieve8Msg] varchar(150) NULL ,
[sieve9Msg] varchar(150) NULL ,
[sieve10Msg] varchar(150) NULL ,
[sieve11Msg] varchar(150) NULL ,
[sieve12Msg] varchar(150) NULL ,
[sieve13Msg] varchar(150) NULL ,
[tempMsg] varchar(255) NULL ,
[oilStoneMsg] varchar(255) NULL ,
[asphaltTemperature] decimal(6,2) NULL ,
[asphaltTempLevel] int NULL ,
[asphaltTempMsg] varchar(255) NULL ,
[aggTemperature] decimal(6,2) NULL ,
[aggTempLevel] int NULL ,
[aggTempMsg] varchar(255) NULL ,
[mixingTemperature] decimal(6,2) NULL ,
[mixingTempLevel] int NULL ,
[mixingTempMsg] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'元数据计算结果表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'元数据计算结果表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'asphaltId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'formulaCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方编码值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'formulaCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方编码值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'formulaCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'oilStoneProportion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'油石比'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'oilStoneProportion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'油石比'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'oilStoneProportion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'asphalt')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphalt'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphalt'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'weight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'weight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'weight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔1--0.075'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔1--0.075'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔2-0.15'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔2-0.15'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔3-0.3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔3-0.3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔4-0.6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔4-0.6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔5-1.18'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔5-1.18'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve6')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔6-2.36'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve6'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔6-2.36'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve6'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve7')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔7-4.75'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve7'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔7-4.75'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve7'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve8')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔8-9.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve8'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔8-9.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve8'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve9')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔9-13.2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve9'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔9-13.2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve9'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve10')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔10-16'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve10'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔10-16'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve10'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve11')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔11-19'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve11'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔11-19'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve11'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve12')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔12-26.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve12'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔12-26.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve12'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve13')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔13-34.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve13'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔13-34.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve13'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'batchCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'批次'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'batchCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'批次'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'batchCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'tempLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出料温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'tempLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出料温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'tempLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'gradationLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'级配超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'gradationLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'级配超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'gradationLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'oilStoneLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'油石比超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'oilStoneLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'油石比超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'oilStoneLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'aggregateWeight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggregateWeight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggregateWeight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'isPass')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格-1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'isPass'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格-1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'isPass'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'dataId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'元数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'dataId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'元数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'dataId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'excessMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'excessMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'excessMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve1State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve1State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve1State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve2State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve2State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve2State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve3State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve3State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve3State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve4State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve4State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve4State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve5State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve5State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve5State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve6State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve6State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve6State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve7State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve7State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve7State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve8State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve8State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve8State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve9State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve9State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve9State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve10State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve10State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve10State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve11State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve11State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve11State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve12State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve12State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve12State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieve13State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve13State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve13State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'temperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'temperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'temperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'sieveVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔计算版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieveVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔计算版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieveVersion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'tempMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出料温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'tempMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出料温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'tempMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'oilStoneMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'油石比超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'oilStoneMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'油石比超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'oilStoneMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'asphaltTemperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphaltTemperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphaltTemperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'asphaltTempLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphaltTempLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphaltTempLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'asphaltTempMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphaltTempMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'asphaltTempMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'aggTemperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'集料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggTemperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'集料温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggTemperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'aggTempLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'集料超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggTempLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'集料超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggTempLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'aggTempMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'集料温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggTempMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'集料温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggTempMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'mixingTemperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'mixingTemperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'mixingTemperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'mixingTempLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合温度超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'mixingTempLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合温度超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'mixingTempLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_metadata_result', 
'COLUMN', N'mixingTempMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'mixingTempMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_metadata_result'
, @level2type = 'COLUMN', @level2name = N'mixingTempMsg'
GO

-- ----------------------------
-- Table structure for imp_asphalt_push_setting
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_push_setting]
GO
CREATE TABLE [dbo].[imp_asphalt_push_setting] (
[id] bigint NOT NULL ,
[asphaltId] bigint NULL ,
[type] int NULL ,
[isOpen] int NULL ,
[phone] varchar(500) NULL ,
[level] int NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
'COLUMN', N'asphaltId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
'COLUMN', N'isOpen')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否开启 0开启1关闭'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'isOpen'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否开启 0开启1关闭'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'isOpen'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'手机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'手机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_push_setting', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_push_setting'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO

-- ----------------------------
-- Table structure for imp_asphalt_sieve_setting
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_sieve_setting]
GO
CREATE TABLE [dbo].[imp_asphalt_sieve_setting] (
[id] bigint NOT NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[formulaId] bigint NULL ,
[level] int NULL ,
[formulaValue] decimal(12,2) NULL ,
[firstHigh] decimal(12,2) NULL ,
[firstLow] decimal(12,2) NULL ,
[secondHigh] decimal(12,2) NULL ,
[secondLow] decimal(12,2) NULL ,
[threeHigh] decimal(12,2) NULL ,
[threeLow] decimal(12,2) NULL ,
[g1] decimal(12,2) NULL ,
[g2] decimal(12,2) NULL ,
[g3] decimal(12,2) NULL ,
[g4] decimal(12,2) NULL ,
[g5] decimal(12,2) NULL ,
[g6] decimal(12,2) NULL ,
[g7] decimal(12,2) NULL ,
[g8] decimal(12,2) NULL ,
[g9] decimal(12,2) NULL ,
[g10] decimal(12,2) NULL ,
[f1] decimal(12,2) NULL ,
[f2] decimal(12,2) NULL ,
[f3] decimal(12,2) NULL ,
[f4] decimal(12,2) NULL ,
[f5] decimal(12,2) NULL ,
[dataVersion] int NULL ,
[isVisible] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'formulaValue')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'formulaValue'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'formulaValue'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'firstHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'firstHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'firstHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'firstLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'firstLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'firstLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'secondHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'secondHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'secondHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'secondLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'secondLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'secondLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'threeHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'threeHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'threeHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'threeLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'threeLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'threeLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g6')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g6'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g6'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g7')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料7'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g7'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料7'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g7'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g8')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料8'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g8'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料8'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g8'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g9')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料9'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g9'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料9'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g9'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'g10')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料10'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g10'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料10'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g10'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'f1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'f2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'f3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'f4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'f5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'粉料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'粉料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'f5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'dataVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_sieve_setting', 
'COLUMN', N'isVisible')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见 1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'isVisible'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见 1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'isVisible'
GO

-- ----------------------------
-- Table structure for imp_asphalt_warning_config
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_warning_config]
GO
CREATE TABLE [dbo].[imp_asphalt_warning_config] (
[id] bigint NOT NULL ,
[type] int NULL ,
[level] int NULL ,
[formulaValue] decimal(6,2) NULL ,
[firstHigh] decimal(6,2) NULL ,
[firstLow] decimal(6,2) NULL ,
[secondHigh] decimal(6,2) NULL ,
[secondLow] decimal(6,2) NULL ,
[threeHigh] decimal(6,2) NULL ,
[threeLow] decimal(6,2) NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[formulaId] bigint NULL ,
[dataVersion] int NULL ,
[isVisible] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'formulaValue')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'目标值--配方值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'formulaValue'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'目标值--配方值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'formulaValue'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'firstHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'firstHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'firstHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'firstLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级下限制'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'firstLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级下限制'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'firstLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'secondHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'secondHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'secondHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'secondLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'secondLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'secondLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'threeHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级上限制'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'threeHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级上限制'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'threeHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'threeLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'threeLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'threeLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'dataVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_config', 
'COLUMN', N'isVisible')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见 1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'isVisible'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见 1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_config'
, @level2type = 'COLUMN', @level2name = N'isVisible'
GO

-- ----------------------------
-- Table structure for imp_asphalt_warning_message
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_warning_message]
GO
CREATE TABLE [dbo].[imp_asphalt_warning_message] (
[id] bigint NOT NULL ,
[dataId] bigint NULL ,
[createTime] datetime NULL ,
[content] varchar(1000) NULL ,
[type] varchar(100) NULL ,
[tempResult] int NULL ,
[asphaltId] bigint NULL ,
[oilStoneResult] int NULL ,
[sieveResult] int NULL ,
[oilStoneMsg] varchar(255) NULL ,
[sieveMsg] varchar(255) NULL ,
[tempMsg] varchar(255) NULL ,
[aggTempMsg] varchar(255) NULL ,
[aggTempResult] int NULL ,
[asphaltTempResult] int NULL ,
[asphaltTempMsg] varchar(255) NULL ,
[dealStatus] int NULL DEFAULT NULL ,
[sendFlag] int NULL DEFAULT NULL ,
[returnKey] varchar(255) NULL DEFAULT NULL ,
[mixingTempResult] int NULL ,
[mixingTempMsg] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警信息表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警信息表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'dataId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'dataId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'dataId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'content'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'tempResult')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'tempResult'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'tempResult'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'asphaltId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'asphaltId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'oilStoneResult')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'油石比'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'oilStoneResult'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'油石比'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'oilStoneResult'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'sieveResult')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标结果'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'sieveResult'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标结果'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'sieveResult'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'aggTempMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'集料超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'aggTempMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'集料超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'aggTempMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'aggTempResult')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'集料超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'aggTempResult'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'集料超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'aggTempResult'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'asphaltTempResult')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'asphaltTempResult'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青温度超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'asphaltTempResult'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'asphaltTempMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'asphaltTempMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青温度超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'asphaltTempMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'dealStatus')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'处理状态 1 处理中 2 审核中 3 已完成'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'dealStatus'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'处理状态 1 处理中 2 审核中 3 已完成'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'dealStatus'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'sendFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'质监局发送状态 0未发送 1已发送'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'sendFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'质监局发送状态 0未发送 1已发送'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'sendFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_message', 
'COLUMN', N'returnKey')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'质监局返回key'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'returnKey'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'质监局返回key'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_message'
, @level2type = 'COLUMN', @level2name = N'returnKey'
GO

-- ----------------------------
-- Table structure for imp_asphalt_warning_note_config
-- ----------------------------
DROP TABLE [dbo].[imp_asphalt_warning_note_config]
GO
CREATE TABLE [dbo].[imp_asphalt_warning_note_config] (
[id] bigint NOT NULL ,
[projectId] bigint NULL ,
[orgId] varchar(255) NULL ,
[asphaltId] varchar(1000) NULL ,
[userId] bigint NULL ,
[userName] varchar(255) NULL ,
[phone] varchar(255) NULL ,
[level1] int NULL ,
[level2] int NULL ,
[level3] int NULL ,
[isOpen] int NULL ,
[type] int NULL ,
[remark] varchar(500) NULL ,
[asphaltNames] varchar(1000) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'李轻沾报警短信配置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'李轻沾报警短信配置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标段Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标段Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'userId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'userId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'userId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'userName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'userName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'userName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'接收电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'接收电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'level1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级接受开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级接受开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'level2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'level3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'isOpen')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'isOpen'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'isOpen'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_asphalt_warning_note_config', 
'COLUMN', N'asphaltNames')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'asphaltNames'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_asphalt_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'asphaltNames'
GO

-- ----------------------------
-- Table structure for imp_car_alamMessage
-- ----------------------------
DROP TABLE [dbo].[imp_car_alamMessage]
GO
CREATE TABLE [dbo].[imp_car_alamMessage] (
[id] bigint NOT NULL ,
[alamType] int NULL ,
[carNumber] varchar(255) NULL ,
[alamTime] datetime2(7) NULL ,
[load] varchar(255) NULL ,
[orgId] bigint NULL ,
[speed] varchar(255) NULL ,
[contact] varchar(255) NULL ,
[contactPhone] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆报警'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆报警'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'alamType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'alamType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'alamType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'carNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'carNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'carNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'alamTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'alamTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'alamTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'load')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'载重'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'load'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'载重'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'load'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'speed')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'速度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'speed'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'速度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'speed'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'contact')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'contact'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'contact'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alamMessage', 
'COLUMN', N'contactPhone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'contactPhone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alamMessage'
, @level2type = 'COLUMN', @level2name = N'contactPhone'
GO

-- ----------------------------
-- Table structure for imp_car_alarm
-- ----------------------------
DROP TABLE [dbo].[imp_car_alarm]
GO
CREATE TABLE [dbo].[imp_car_alarm] (
[id] bigint NOT NULL ,
[positionId] bigint NULL ,
[alarmType] int NULL ,
[alarmMessage] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alarm', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆状态  对应车辆位置id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alarm'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆状态  对应车辆位置id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alarm'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alarm', 
'COLUMN', N'positionId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆位置信息id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alarm'
, @level2type = 'COLUMN', @level2name = N'positionId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆位置信息id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alarm'
, @level2type = 'COLUMN', @level2name = N'positionId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alarm', 
'COLUMN', N'alarmType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alarm'
, @level2type = 'COLUMN', @level2name = N'alarmType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alarm'
, @level2type = 'COLUMN', @level2name = N'alarmType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_alarm', 
'COLUMN', N'alarmMessage')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alarm'
, @level2type = 'COLUMN', @level2name = N'alarmMessage'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_alarm'
, @level2type = 'COLUMN', @level2name = N'alarmMessage'
GO

-- ----------------------------
-- Table structure for imp_car_carClient
-- ----------------------------
DROP TABLE [dbo].[imp_car_carClient]
GO
CREATE TABLE [dbo].[imp_car_carClient] (
[id] bigint NOT NULL ,
[province] varchar(255) NULL ,
[city] varchar(255) NULL ,
[manufacture] varchar(255) NULL ,
[clientTypeNo] varchar(255) NULL ,
[clientId] int NULL ,
[licenceColor] varchar(255) NULL ,
[licenceNo] varchar(255) NULL ,
[bindingStatus] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆信息 '
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆信息 '
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
'COLUMN', N'province')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'省会编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'province'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'省会编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'province'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
'COLUMN', N'city')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'城市县编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'city'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'城市县编码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'city'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
'COLUMN', N'manufacture')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'制造商'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'manufacture'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'制造商'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'manufacture'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
'COLUMN', N'clientTypeNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备类型编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'clientTypeNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备类型编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'clientTypeNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
'COLUMN', N'clientId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'clientId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'clientId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
'COLUMN', N'licenceColor')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车牌颜色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'licenceColor'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车牌颜色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'licenceColor'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_carClient', 
'COLUMN', N'licenceNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'licenceNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_carClient'
, @level2type = 'COLUMN', @level2name = N'licenceNo'
GO

-- ----------------------------
-- Table structure for imp_car_deleteElectricfence
-- ----------------------------
DROP TABLE [dbo].[imp_car_deleteElectricfence]
GO
CREATE TABLE [dbo].[imp_car_deleteElectricfence] (
[id] bigint NOT NULL ,
[carId] varchar(255) NULL ,
[electricFenceMark] int NULL ,
[numberOfRegions] int NULL DEFAULT ((0)) 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_deleteElectricfence', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电子围栏删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电子围栏删除'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_deleteElectricfence', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_deleteElectricfence', 
'COLUMN', N'carId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
, @level2type = 'COLUMN', @level2name = N'carId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
, @level2type = 'COLUMN', @level2name = N'carId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_deleteElectricfence', 
'COLUMN', N'electricFenceMark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'围栏标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
, @level2type = 'COLUMN', @level2name = N'electricFenceMark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'围栏标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
, @level2type = 'COLUMN', @level2name = N'electricFenceMark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_deleteElectricfence', 
'COLUMN', N'numberOfRegions')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'区域数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
, @level2type = 'COLUMN', @level2name = N'numberOfRegions'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'区域数'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_deleteElectricfence'
, @level2type = 'COLUMN', @level2name = N'numberOfRegions'
GO

-- ----------------------------
-- Table structure for imp_car_electricFence
-- ----------------------------
DROP TABLE [dbo].[imp_car_electricFence]
GO
CREATE TABLE [dbo].[imp_car_electricFence] (
[id] bigint NOT NULL ,
[orgId] bigint NULL ,
[fenceName] varchar(255) NULL ,
[locationMessage] varchar(255) NULL ,
[carMessage] nvarchar(MAX) NULL ,
[fancePosition] nvarchar(MAX) NULL ,
[fancePositionStatus] int NULL ,
[remark] varchar(255) NULL ,
[wsg84] nvarchar(MAX) NULL ,
[pointCenter] varchar(255) NULL ,
[electricFencemark] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电子围栏'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电子围栏'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'fenceName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'围栏名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'fenceName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'围栏名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'fenceName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'locationMessage')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'位置信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'locationMessage'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'位置信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'locationMessage'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'carMessage')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'关联车辆'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'carMessage'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'关联车辆'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'carMessage'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'fancePosition')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'围栏位置坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'fancePosition'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'围栏位置坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'fancePosition'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'fancePositionStatus')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'围栏下发状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'fancePositionStatus'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'围栏下发状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'fancePositionStatus'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'wsg84')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经纬度坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'wsg84'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经纬度坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'wsg84'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_electricFence', 
'COLUMN', N'electricFencemark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电子围栏唯一标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'electricFencemark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电子围栏唯一标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_electricFence'
, @level2type = 'COLUMN', @level2name = N'electricFencemark'
GO

-- ----------------------------
-- Table structure for imp_car_fenceRecord
-- ----------------------------
DROP TABLE [dbo].[imp_car_fenceRecord]
GO
CREATE TABLE [dbo].[imp_car_fenceRecord] (
[id] bigint NOT NULL ,
[electricFenceId] bigint NULL ,
[fancePosition] nvarchar(MAX) NULL ,
[wsg84] nvarchar(MAX) NULL ,
[pointCenter] varchar(255) NULL ,
[startTime] datetime2(7) NULL ,
[endTime] datetime2(7) NULL ,
[carMessage] nvarchar(MAX) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'围栏记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'围栏记录'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键 无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键 无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
'COLUMN', N'electricFenceId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'围栏id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'electricFenceId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'围栏id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'electricFenceId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
'COLUMN', N'fancePosition')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'围栏位置坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'fancePosition'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'围栏位置坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'fancePosition'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
'COLUMN', N'wsg84')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经纬度坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'wsg84'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经纬度坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'wsg84'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
'COLUMN', N'pointCenter')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'围栏中心点'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'pointCenter'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'围栏中心点'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'pointCenter'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
'COLUMN', N'startTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'startTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'startTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
'COLUMN', N'endTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'endTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'endTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_fenceRecord', 
'COLUMN', N'carMessage')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'carMessage'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_fenceRecord'
, @level2type = 'COLUMN', @level2name = N'carMessage'
GO

-- ----------------------------
-- Table structure for imp_car_position
-- ----------------------------
DROP TABLE [dbo].[imp_car_position]
GO
CREATE TABLE [dbo].[imp_car_position] (
[carnum] varchar(255) NULL ,
[address] varchar(255) NULL ,
[xlabe] decimal(38,18) NULL ,
[ylabe] decimal(38,18) NULL ,
[speed] decimal(18,2) NULL ,
[locationTime] varchar(255) NULL ,
[direction] int NULL ,
[id] bigint NOT NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_position', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆位置信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆位置信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_position', 
'COLUMN', N'carnum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'carnum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'carnum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_position', 
'COLUMN', N'address')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'address'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'address'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_position', 
'COLUMN', N'xlabe')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'xlabe'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'xlabe'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_position', 
'COLUMN', N'ylabe')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'ylabe'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'ylabe'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_position', 
'COLUMN', N'speed')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'速度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'speed'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'速度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'speed'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_position', 
'COLUMN', N'locationTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'监控时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'locationTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'监控时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'locationTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_position', 
'COLUMN', N'direction')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'方向 '
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'direction'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'方向 '
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_position'
, @level2type = 'COLUMN', @level2name = N'direction'
GO

-- ----------------------------
-- Table structure for imp_car_position_201901
-- ----------------------------
DROP TABLE [dbo].[imp_car_position_201901]
GO
CREATE TABLE [dbo].[imp_car_position_201901] (
[carnum] varchar(255) NULL ,
[address] varchar(255) NULL ,
[xlabe] decimal(38,18) NULL ,
[ylabe] decimal(38,18) NULL ,
[speed] decimal(18,2) NULL ,
[locationTime] varchar(255) NULL ,
[direction] int NULL ,
[id] bigint NOT NULL 
)


GO

-- ----------------------------
-- Table structure for imp_car_status
-- ----------------------------
DROP TABLE [dbo].[imp_car_status]
GO
CREATE TABLE [dbo].[imp_car_status] (
[id] bigint NOT NULL ,
[positionId] bigint NULL ,
[carStatus] int NULL ,
[statusKey] int NULL ,
[statusMessage] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_status', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_status', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_status', 
'COLUMN', N'positionId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'位置id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'positionId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'位置id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'positionId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_status', 
'COLUMN', N'carStatus')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'carStatus'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'carStatus'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_status', 
'COLUMN', N'statusKey')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态key'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'statusKey'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态key'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'statusKey'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_status', 
'COLUMN', N'statusMessage')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'statusMessage'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_status'
, @level2type = 'COLUMN', @level2name = N'statusMessage'
GO

-- ----------------------------
-- Table structure for imp_car_vehicleManagement
-- ----------------------------
DROP TABLE [dbo].[imp_car_vehicleManagement]
GO
CREATE TABLE [dbo].[imp_car_vehicleManagement] (
[id] bigint NOT NULL ,
[carNumber] varchar(255) NULL ,
[carMark] int NULL ,
[rfCardNumber] varchar(255) NULL ,
[gpsCardNumber] varchar(255) NULL ,
[contact] varchar(255) NULL ,
[contactPhone] varchar(13) NULL ,
[load] decimal(18,2) NULL ,
[addTime] datetime2(7) NULL ,
[orgId] bigint NULL ,
[data1] varchar(255) NULL ,
[data2] varchar(255) NULL ,
[carType] int NULL ,
[isIssued] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆管理'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆管理'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键无意义'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'carNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'carNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车牌号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'carNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'carMark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'carMark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'carMark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'rfCardNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'射频卡编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'rfCardNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'射频卡编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'rfCardNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'gpsCardNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'gps卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'gpsCardNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'gps卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'gpsCardNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'contact')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'contact'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'contact'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'contactPhone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系人电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'contactPhone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系人电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'contactPhone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'load')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'载重'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'load'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'载重'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'load'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'addTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'添加时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'addTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'添加时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'addTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'data1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'data1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'data1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'data2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'data2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预留字段2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'data2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_car_vehicleManagement', 
'COLUMN', N'isIssued')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'0 未下发 1 已下发'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'isIssued'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'0 未下发 1 已下发'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_car_vehicleManagement'
, @level2type = 'COLUMN', @level2name = N'isIssued'
GO

-- ----------------------------
-- Table structure for imp_code_type
-- ----------------------------
DROP TABLE [dbo].[imp_code_type]
GO
CREATE TABLE [dbo].[imp_code_type] (
[type_id] varchar(255) NOT NULL ,
[code_name] varchar(255) NOT NULL ,
[code_value] varchar(255) NOT NULL ,
[remark] varchar(255) NULL ,
[id] int NOT NULL IDENTITY(1,1) ,
[index] int NULL DEFAULT ((0)) 
)


GO
DBCC CHECKIDENT(N'[dbo].[imp_code_type]', RESEED, 158)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_code_type', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'常用代码表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'常用代码表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_code_type', 
'COLUMN', N'type_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'字段代码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'type_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'字段代码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'type_id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_code_type', 
'COLUMN', N'code_name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'变量名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'code_name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'变量名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'code_name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_code_type', 
'COLUMN', N'code_value')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'变量值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'code_value'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'变量值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'code_value'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_code_type', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_code_type', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_code_type', 
'COLUMN', N'index')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'index'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_code_type'
, @level2type = 'COLUMN', @level2name = N'index'
GO

-- ----------------------------
-- Table structure for imp_continuous_warning
-- ----------------------------
DROP TABLE [dbo].[imp_continuous_warning]
GO
CREATE TABLE [dbo].[imp_continuous_warning] (
[id] bigint NOT NULL ,
[projectId] bigint NULL ,
[projectName] varchar(255) NULL ,
[mixerType] int NULL ,
[warningType] int NULL ,
[firstWarning] int NULL ,
[secondWarning] int NULL ,
[threeWarning] int NULL ,
[remark] varchar(1000) NULL ,
[updateTime] datetime2(7) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'projectId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'项目名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'projectId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'项目名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'projectId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'projectName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'项目名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'projectName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'项目名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'projectName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'mixerType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'mixerType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'mixerType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'warningType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预警类型(1:区分超标级别 2：:不区分超标级别）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'warningType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预警类型(1:区分超标级别 2：:不区分超标级别）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'warningType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'firstWarning')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级预警连续盘数(区分级别直接取低级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'firstWarning'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级预警连续盘数(区分级别直接取低级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'firstWarning'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'secondWarning')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级预警连续盘数(区分级别直接取中级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'secondWarning'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级预警连续盘数(区分级别直接取中级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'secondWarning'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'threeWarning')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级预警连续盘数(区分级别直接取高级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'threeWarning'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级预警连续盘数(区分级别直接取高级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'threeWarning'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO

-- ----------------------------
-- Table structure for imp_continuous_warning_Record
-- ----------------------------
DROP TABLE [dbo].[imp_continuous_warning_Record]
GO
CREATE TABLE [dbo].[imp_continuous_warning_Record] (
[id] bigint NOT NULL ,
[continuWarningId] bigint NULL ,
[userId] bigint NULL ,
[userName] varchar(255) NULL ,
[updateTime] datetime2(7) NULL ,
[mixerType] int NULL ,
[warningType] int NULL ,
[firstWarning] int NULL ,
[secondWarning] int NULL ,
[threeWarning] int NULL ,
[remark] varchar(1000) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'continuWarningId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'连续超标配置Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'continuWarningId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'连续超标配置Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'continuWarningId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'userId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'userId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'userId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'userName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'userName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'userName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'修改时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'mixerType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'mixerType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'mixerType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'warningType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预警类型(1:区分超标级别 2：:不区分超标级别）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'warningType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预警类型(1:区分超标级别 2：:不区分超标级别）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'warningType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'firstWarning')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级预警连续盘数(区分级别直接取低级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'firstWarning'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级预警连续盘数(区分级别直接取低级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'firstWarning'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'secondWarning')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级预警连续盘数(区分级别直接取中级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'secondWarning'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级预警连续盘数(区分级别直接取中级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'secondWarning'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'threeWarning')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级预警连续盘数(区分级别直接取高级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'threeWarning'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级预警连续盘数(区分级别直接取高级）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'threeWarning'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_continuous_warning_Record', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_continuous_warning_Record'
, @level2type = 'COLUMN', @level2name = N'remark'
GO

-- ----------------------------
-- Table structure for imp_machine_phone_note_record
-- ----------------------------
DROP TABLE [dbo].[imp_machine_phone_note_record]
GO
CREATE TABLE [dbo].[imp_machine_phone_note_record] (
[id] bigint NOT NULL ,
[type] int NULL ,
[userName] varchar(255) NULL ,
[phone] varchar(255) NULL ,
[mixName] varchar(255) NULL ,
[content] varchar(1000) NULL ,
[sendTime] datetime2(7) NULL ,
[projectName] varchar(255) NULL ,
[success] varchar(255) NULL ,
[sendType] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'记录水稳及沥青统计短信'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'记录水稳及沥青统计短信'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'1:水稳2:沥青'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'1:水稳2:沥青'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'userName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发送人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'userName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发送人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'userName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'mixName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'mixName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'mixName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发送内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发送内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'content'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'sendTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'发送时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'sendTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'发送时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'sendTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'projectName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'项目名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'projectName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'项目名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'projectName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'success')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'返回状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'success'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'返回状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'success'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_machine_phone_note_record', 
'COLUMN', N'sendType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'推送类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'sendType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'推送类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_machine_phone_note_record'
, @level2type = 'COLUMN', @level2name = N'sendType'
GO

-- ----------------------------
-- Table structure for imp_org_link
-- ----------------------------
DROP TABLE [dbo].[imp_org_link]
GO
CREATE TABLE [dbo].[imp_org_link] (
[id] bigint NOT NULL IDENTITY(1,1) ,
[orgId] bigint NULL ,
[linkOrgId] bigint NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[imp_org_link]', RESEED, 118)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_org_link', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'管理组织表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_org_link'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'管理组织表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_org_link'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_org_link', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_org_link'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_org_link'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_org_link', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_org_link'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_org_link'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_org_link', 
'COLUMN', N'linkOrgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'所管理的组织机构Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_org_link'
, @level2type = 'COLUMN', @level2name = N'linkOrgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'所管理的组织机构Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_org_link'
, @level2type = 'COLUMN', @level2name = N'linkOrgId'
GO

-- ----------------------------
-- Table structure for imp_organization
-- ----------------------------
DROP TABLE [dbo].[imp_organization]
GO
CREATE TABLE [dbo].[imp_organization] (
[id] bigint NOT NULL ,
[name] varchar(128) NULL ,
[type] int NULL ,
[number] varchar(128) NULL ,
[keyword] varchar(128) NULL ,
[createUserId] bigint NULL ,
[createTime] datetime2(7) NULL ,
[status] int NULL ,
[address] varchar(400) NULL ,
[phone] varchar(128) NULL ,
[web] varchar(128) NULL ,
[remark] varchar(400) NULL ,
[parentId] bigint NULL ,
[postcode] varchar(255) NULL ,
[tenderNo] varchar(255) NULL ,
[units] varchar(255) NULL ,
[workType] varchar(255) NULL ,
[contractType] varchar(255) NULL ,
[startPoint] varchar(255) NULL ,
[endPoint] varchar(255) NULL ,
[fullLength] varchar(255) NULL ,
[startDate] varchar(255) NULL ,
[estimateEndDate] varchar(255) NULL ,
[sub] varchar(255) NULL ,
[submitDate] varchar(255) NULL ,
[level] int NULL ,
[logo] varchar(255) NULL ,
[synopsis] varchar(2000) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'number')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'number'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'number'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'keyword')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构关键字'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'keyword'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构关键字'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'keyword'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'createUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'createUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'createUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'address')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'address'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'address'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'web')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主页'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'web'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主页'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'web'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'parentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上级组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'parentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上级组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'parentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'postcode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'邮编'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'postcode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'邮编'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'postcode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'tenderNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标段号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'tenderNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标段号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'tenderNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'units')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'units'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'单位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'units'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'workType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工程类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'workType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工程类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'workType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'contractType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'合同类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'contractType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'合同类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'contractType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'startPoint')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'起始位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'startPoint'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'起始位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'startPoint'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'endPoint')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'结束位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'endPoint'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'结束位置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'endPoint'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'fullLength')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'全长'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'fullLength'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'全长'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'fullLength'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'startDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'开工时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'startDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'开工时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'startDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'estimateEndDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预计完工时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'estimateEndDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预计完工时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'estimateEndDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'sub')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'期次(月)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'sub'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'期次(月)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'sub'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'submitDate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'业务上报日'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'submitDate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'业务上报日'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'submitDate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'树层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'树层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'logo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'项目logo'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'logo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'项目logo'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'logo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_organization', 
'COLUMN', N'synopsis')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'简介'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'synopsis'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'简介'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_organization'
, @level2type = 'COLUMN', @level2name = N'synopsis'
GO

-- ----------------------------
-- Table structure for imp_projectType
-- ----------------------------
DROP TABLE [dbo].[imp_projectType]
GO
CREATE TABLE [dbo].[imp_projectType] (
[typeName] varchar(64) NULL ,
[memo] varchar(255) NULL ,
[orgTypeid] varchar(10) NULL ,
[orderNo] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_projectType', 
'COLUMN', N'orderNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_projectType'
, @level2type = 'COLUMN', @level2name = N'orderNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_projectType'
, @level2type = 'COLUMN', @level2name = N'orderNo'
GO

-- ----------------------------
-- Table structure for imp_radiofrequency_data
-- ----------------------------
DROP TABLE [dbo].[imp_radiofrequency_data]
GO
CREATE TABLE [dbo].[imp_radiofrequency_data] (
[id] bigint NOT NULL ,
[cardMark] varchar(255) NULL ,
[time] bigint NULL ,
[position] varchar(255) NULL ,
[type] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_radiofrequency_data', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'射频扫描上传信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'射频扫描上传信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_radiofrequency_data', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_radiofrequency_data', 
'COLUMN', N'cardMark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'射频卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'cardMark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'射频卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'cardMark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_radiofrequency_data', 
'COLUMN', N'time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'时间戳，扫描时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'时间戳，扫描时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_radiofrequency_data', 
'COLUMN', N'position')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'射频位置-上报机器唯一标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'position'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'射频位置-上报机器唯一标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'position'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_radiofrequency_data', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'射频上报机器类型 0拌合站打卡，1摊铺机打卡'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'射频上报机器类型 0拌合站打卡，1摊铺机打卡'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_radiofrequency_data'
, @level2type = 'COLUMN', @level2name = N'type'
GO

-- ----------------------------
-- Table structure for imp_resource
-- ----------------------------
DROP TABLE [dbo].[imp_resource]
GO
CREATE TABLE [dbo].[imp_resource] (
[id] bigint NOT NULL ,
[name] varchar(255) NULL ,
[path] varchar(255) NULL ,
[parentId] bigint NULL ,
[remark] varchar(512) NULL ,
[status] int NULL ,
[sourceType] int NULL ,
[icon] varchar(255) NULL ,
[orderNum] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_resource', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'系统资源'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'系统资源'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_resource', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_resource', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'资源名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'资源名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_resource', 
'COLUMN', N'path')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'资源路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'path'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'资源路径'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'path'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_resource', 
'COLUMN', N'parentId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'父级ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'parentId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'父级ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'parentId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_resource', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_resource', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_resource', 
'COLUMN', N'orderNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'排序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'orderNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'排序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_resource'
, @level2type = 'COLUMN', @level2name = N'orderNum'
GO

-- ----------------------------
-- Table structure for imp_role
-- ----------------------------
DROP TABLE [dbo].[imp_role]
GO
CREATE TABLE [dbo].[imp_role] (
[id] bigint NOT NULL ,
[name] varchar(128) NULL ,
[remark] varchar(512) NULL ,
[status] int NULL ,
[groupId] bigint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role', 
'COLUMN', N'groupId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色组ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'groupId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色组ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role'
, @level2type = 'COLUMN', @level2name = N'groupId'
GO

-- ----------------------------
-- Table structure for imp_role_group
-- ----------------------------
DROP TABLE [dbo].[imp_role_group]
GO
CREATE TABLE [dbo].[imp_role_group] (
[id] bigint NOT NULL ,
[groupName] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role_group', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色组'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_group'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色组'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_group'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role_group', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_group'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_group'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role_group', 
'COLUMN', N'groupName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色组名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_group'
, @level2type = 'COLUMN', @level2name = N'groupName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色组名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_group'
, @level2type = 'COLUMN', @level2name = N'groupName'
GO

-- ----------------------------
-- Table structure for imp_role_resource_link
-- ----------------------------
DROP TABLE [dbo].[imp_role_resource_link]
GO
CREATE TABLE [dbo].[imp_role_resource_link] (
[id] bigint NOT NULL ,
[roleId] bigint NULL ,
[resourceId] bigint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role_resource_link', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色资源链接表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_resource_link'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色资源链接表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_resource_link'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role_resource_link', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_resource_link'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_resource_link'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role_resource_link', 
'COLUMN', N'roleId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'角色ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_resource_link'
, @level2type = 'COLUMN', @level2name = N'roleId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'角色ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_resource_link'
, @level2type = 'COLUMN', @level2name = N'roleId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_role_resource_link', 
'COLUMN', N'resourceId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'资源ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_resource_link'
, @level2type = 'COLUMN', @level2name = N'resourceId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'资源ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_role_resource_link'
, @level2type = 'COLUMN', @level2name = N'resourceId'
GO

-- ----------------------------
-- Table structure for imp_transport_info
-- ----------------------------
DROP TABLE [dbo].[imp_transport_info]
GO
CREATE TABLE [dbo].[imp_transport_info] (
[id] bigint NOT NULL ,
[orgId] bigint NULL ,
[carMark] varchar(255) NULL ,
[carId] bigint NULL ,
[receiveStartTime] datetime NULL ,
[receiveEndTime] datetime NULL ,
[outputStartTime] datetime NULL ,
[outputEndTime] datetime NULL ,
[receiveTime] bigint NULL ,
[transportTime] bigint NULL ,
[outputTime] bigint NULL ,
[status] int NOT NULL ,
[pavingCarId] varchar(255) NULL ,
[pavingCarName] varchar(255) NULL ,
[mixingName] varchar(255) NULL ,
[mixingId] bigint NULL ,
[mixingType] int NULL ,
[weight] decimal(12,2) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆接料-运输-对接出料的过程数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆接料-运输-对接出料的过程数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'carMark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆射频卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'carMark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆射频卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'carMark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'carId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'carId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'carId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'receiveStartTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'接料开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'receiveStartTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'接料开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'receiveStartTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'receiveEndTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'接料结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'receiveEndTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'接料结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'receiveEndTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'outputStartTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'对接出料开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'outputStartTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'对接出料开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'outputStartTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'outputEndTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'对接出料结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'outputEndTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'对接出料结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'outputEndTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'receiveTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'对接时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'receiveTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'对接时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'receiveTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'transportTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'运输时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'transportTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'运输时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'transportTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'outputTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'对接出料时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'outputTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'对接出料时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'outputTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态，1接料中，2运输中，3对接出料中，4结束'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态，1接料中，2运输中，3对接出料中，4结束'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'pavingCarId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'摊铺机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'pavingCarId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摊铺机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'pavingCarId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'pavingCarName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'摊铺机名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'pavingCarName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摊铺机名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'pavingCarName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'mixingName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合站名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'mixingName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合站名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'mixingName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'mixingId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'mixingId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'mixingId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'mixingType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'mixingType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'mixingType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_transport_info', 
'COLUMN', N'weight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'weight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_transport_info'
, @level2type = 'COLUMN', @level2name = N'weight'
GO

-- ----------------------------
-- Table structure for imp_user
-- ----------------------------
DROP TABLE [dbo].[imp_user]
GO
CREATE TABLE [dbo].[imp_user] (
[id] bigint NOT NULL ,
[name] varchar(128) NOT NULL ,
[sex] int NULL ,
[loginName] varchar(128) NULL ,
[userNo] varchar(128) NULL ,
[keyword] varchar(128) NULL ,
[orgId] bigint NULL ,
[station] varchar(128) NULL ,
[mobileNo] varchar(64) NULL ,
[workPhone] varchar(128) NULL ,
[email] varchar(128) NULL ,
[qq] varchar(128) NULL ,
[weChat] varchar(128) NULL ,
[status] int NULL ,
[createUserId] bigint NULL ,
[createTime] datetime2(7) NULL ,
[remark] varchar(512) NULL ,
[cardNumber] varchar(512) NULL ,
[password] varchar(128) NULL ,
[softDog] varchar(128) NULL ,
[isAdmin] bit NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户ID（用户不感知）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户ID（用户不感知）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'sex')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'性别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'sex'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'性别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'sex'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'loginName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户登录名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'loginName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户登录名'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'loginName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'userNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'userNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'userNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'keyword')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户关键字'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'keyword'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户关键字'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'keyword'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'所在组织机构'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'所在组织机构'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'station')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'岗位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'station'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'岗位'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'station'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'mobileNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'手机号码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'mobileNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'手机号码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'mobileNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'workPhone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工作电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'workPhone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工作电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'workPhone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'email')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'email'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'email'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'email'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'email'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'qq')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'qq'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'qq'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'qq'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'qq'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'weChat')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'微信号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'weChat'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'微信号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'weChat'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'createUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'createUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'createUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'cardNumber')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'证号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'cardNumber'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'证号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'cardNumber'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'password')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'密码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'password'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'密码'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'password'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'softDog')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'密码（加密方式不同）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'softDog'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'密码（加密方式不同）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'softDog'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user', 
'COLUMN', N'isAdmin')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否超级管理员'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'isAdmin'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否超级管理员'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user'
, @level2type = 'COLUMN', @level2name = N'isAdmin'
GO

-- ----------------------------
-- Table structure for imp_user_org_link
-- ----------------------------
DROP TABLE [dbo].[imp_user_org_link]
GO
CREATE TABLE [dbo].[imp_user_org_link] (
[id] bigint NOT NULL IDENTITY(1,1) ,
[userId] bigint NOT NULL ,
[orgId] bigint NOT NULL ,
[projectId] bigint NOT NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[imp_user_org_link]', RESEED, 10058)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_org_link', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户组织机构权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户组织机构权限'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_org_link', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_org_link', 
'COLUMN', N'userId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'userId'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
, @level2type = 'COLUMN', @level2name = N'userId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'userId'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
, @level2type = 'COLUMN', @level2name = N'userId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_org_link', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'orgId'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'orgId'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_org_link', 
'COLUMN', N'projectId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'项目Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
, @level2type = 'COLUMN', @level2name = N'projectId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'项目Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_org_link'
, @level2type = 'COLUMN', @level2name = N'projectId'
GO

-- ----------------------------
-- Table structure for imp_user_role_link
-- ----------------------------
DROP TABLE [dbo].[imp_user_role_link]
GO
CREATE TABLE [dbo].[imp_user_role_link] (
[id] bigint NOT NULL ,
[userId] bigint NULL ,
[roleId] bigint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_role_link', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户权限关联'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_role_link'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户权限关联'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_role_link'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_role_link', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_role_link'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_role_link'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_role_link', 
'COLUMN', N'userId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_role_link'
, @level2type = 'COLUMN', @level2name = N'userId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_role_link'
, @level2type = 'COLUMN', @level2name = N'userId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_user_role_link', 
'COLUMN', N'roleId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'权限ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_role_link'
, @level2type = 'COLUMN', @level2name = N'roleId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'权限ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_user_role_link'
, @level2type = 'COLUMN', @level2name = N'roleId'
GO

-- ----------------------------
-- Table structure for imp_water_formula
-- ----------------------------
DROP TABLE [dbo].[imp_water_formula]
GO
CREATE TABLE [dbo].[imp_water_formula] (
[id] bigint NOT NULL ,
[number] varchar(100) NULL ,
[name] varchar(100) NULL ,
[pavingLevel] bigint NULL ,
[planOutput] decimal(12,2) NULL ,
[status] int NULL ,
[stationId] bigint NULL ,
[remarks] varchar(300) NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[dataVersion] int NULL ,
[isVisible] int NULL ,
[type] int NULL DEFAULT NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青配方表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青配方表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'number')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'number'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'number'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'pavingLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'摊铺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'pavingLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摊铺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'pavingLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'planOutput')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'计划产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'planOutput'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'计划产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'planOutput'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方状态--0启用-1禁用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方状态--0启用-1禁用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'stationId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'stationId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'stationId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'remarks')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'remarks'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'remarks'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'dataVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'isVisible')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见-1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'isVisible'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见-1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'isVisible'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_formula', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方类型 0 默认 1 非默认'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方类型 0 默认 1 非默认'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_formula'
, @level2type = 'COLUMN', @level2name = N'type'
GO

-- ----------------------------
-- Table structure for imp_water_info
-- ----------------------------
DROP TABLE [dbo].[imp_water_info]
GO
CREATE TABLE [dbo].[imp_water_info] (
[id] bigint NOT NULL ,
[name] varchar(150) NULL ,
[contact] varchar(150) NULL ,
[phone] varchar(20) NULL ,
[installTime] datetime NULL ,
[address] varchar(500) NULL ,
[coordinate] varchar(150) NULL ,
[aggregateNum] int NULL ,
[aggregateName] varchar(1500) NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[remarks] varchar(500) NULL ,
[orgId] bigint NULL ,
[type] varchar(255) NULL ,
[planCount] decimal(18,2) NULL ,
[isOpen] int NULL ,
[warningPhone] varchar(255) NULL ,
[cardMark] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青站基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青站基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'contact')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'contact'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'contact'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'installTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'安装时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'installTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'安装时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'installTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'address')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'address'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'address'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'coordinate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'coordinate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'coordinate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'aggregateNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料仓数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'aggregateNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料仓数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'aggregateNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'aggregateName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料仓名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'aggregateName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料仓名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'aggregateName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'remarks')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'remarks'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'remarks'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构--隶属标段'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构--隶属标段'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'型号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'型号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'planCount')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'计划产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'planCount'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'计划产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'planCount'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info', 
'COLUMN', N'cardMark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'射频卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'cardMark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'射频卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info'
, @level2type = 'COLUMN', @level2name = N'cardMark'
GO

-- ----------------------------
-- Table structure for imp_water_info_copy
-- ----------------------------
DROP TABLE [dbo].[imp_water_info_copy]
GO
CREATE TABLE [dbo].[imp_water_info_copy] (
[id] bigint NOT NULL ,
[name] varchar(150) NULL ,
[contact] varchar(150) NULL ,
[phone] varchar(20) NULL ,
[installTime] datetime NULL ,
[address] varchar(500) NULL ,
[coordinate] varchar(150) NULL ,
[aggregateNum] int NULL ,
[aggregateName] varchar(1500) NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[remarks] varchar(500) NULL ,
[orgId] bigint NULL ,
[type] varchar(255) NULL ,
[planCount] decimal(18,2) NULL ,
[isOpen] int NULL ,
[warningPhone] varchar(255) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青站基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青站基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'contact')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'contact'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'contact'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'联系电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'installTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'安装时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'installTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'安装时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'installTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'address')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'address'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'address'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'coordinate')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'coordinate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'坐标'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'coordinate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'aggregateNum')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料仓数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'aggregateNum'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料仓数量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'aggregateNum'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'aggregateName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料仓名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'aggregateName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料仓名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'aggregateName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'remarks')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'remarks'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'remarks'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构--隶属标段'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构--隶属标段'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'型号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'型号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_info_copy', 
'COLUMN', N'planCount')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'计划产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'planCount'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'计划产量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_info_copy'
, @level2type = 'COLUMN', @level2name = N'planCount'
GO

-- ----------------------------
-- Table structure for imp_water_metadata
-- ----------------------------
DROP TABLE [dbo].[imp_water_metadata]
GO
CREATE TABLE [dbo].[imp_water_metadata] (
[id] bigint NOT NULL ,
[time] datetime NULL ,
[stationId] bigint NULL ,
[formulaId] bigint NULL ,
[cement] decimal(12,2) NULL ,
[water] decimal(12,2) NULL ,
[g1] decimal(12,2) NULL ,
[g2] decimal(12,2) NULL ,
[g3] decimal(12,2) NULL ,
[g4] decimal(12,2) NULL ,
[g5] decimal(12,2) NULL ,
[g6] decimal(12,2) NULL ,
[g7] decimal(12,2) NULL ,
[g8] decimal(12,2) NULL ,
[g9] decimal(12,2) NULL ,
[g10] decimal(12,2) NULL ,
[warnLevel] int NULL ,
[createTime] datetime NULL ,
[batchCode] varchar(150) NULL ,
[weight] decimal(12,2) NULL ,
[formulaCode] varchar(255) NULL ,
[mixTime] bigint NULL ,
[isPass] int NULL ,
[startTime] datetime NULL ,
[endTime] datetime NULL ,
[sieveVersion] int NULL ,
[dataVersion] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'沥青元数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'沥青元数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'stationId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水稳站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'stationId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水稳站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'stationId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'cement')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水泥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'cement'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水泥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'cement'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'water')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'water'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'water'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g6')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g6'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g6'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g7')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料7'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g7'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料7'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g7'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g8')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料8'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g8'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料8'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g8'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g9')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料9'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g9'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料9'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g9'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'g10')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料10'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g10'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料10'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'g10'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'warnLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'warnLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'warnLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'batchCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'批次编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'batchCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'批次编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'batchCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'weight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'weight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'weight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'mixTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合时长'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'mixTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合时长'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'mixTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'isPass')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格 1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'isPass'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格 1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'isPass'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'startTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'startTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'startTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'endTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'endTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'endTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata', 
'COLUMN', N'dataVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料配比版本号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料配比版本号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
GO

-- ----------------------------
-- Table structure for imp_water_metadata_aggregate
-- ----------------------------
DROP TABLE [dbo].[imp_water_metadata_aggregate]
GO
CREATE TABLE [dbo].[imp_water_metadata_aggregate] (
[id] bigint NOT NULL ,
[time] datetime NULL ,
[stationId] bigint NULL ,
[formulaId] bigint NULL ,
[cement] decimal(6,2) NULL ,
[water] decimal(12,2) NULL ,
[g1] decimal(12,2) NULL ,
[g2] decimal(12,2) NULL ,
[g3] decimal(12,2) NULL ,
[g4] decimal(12,2) NULL ,
[g5] decimal(12,2) NULL ,
[g6] decimal(12,2) NULL ,
[g7] decimal(12,2) NULL ,
[g8] decimal(12,2) NULL ,
[g9] decimal(12,2) NULL ,
[g10] decimal(12,2) NULL ,
[batchCode] varchar(150) NULL ,
[weight] decimal(12,2) NULL ,
[dataId] bigint NULL DEFAULT NULL ,
[levelSeries] varchar(255) NULL DEFAULT NULL ,
[formulaCode] varchar(100) NULL ,
[aggregateLevel] int NULL ,
[aggregateWeight] decimal(12,2) NULL ,
[isPass] int NULL ,
[excessMsg] varchar(1500) NULL ,
[g1State] int NULL ,
[g2State] int NULL ,
[g3State] int NULL ,
[g4State] int NULL ,
[g5State] int NULL ,
[g6State] int NULL ,
[g7State] int NULL ,
[g8State] int NULL ,
[g9State] int NULL ,
[g10State] int NULL ,
[sieveVersion] int NULL ,
[g1Msg] varchar(150) NULL ,
[g2Msg] varchar(150) NULL ,
[g3Msg] varchar(150) NULL ,
[g4Msg] varchar(150) NULL ,
[g5Msg] varchar(150) NULL ,
[g6Msg] varchar(150) NULL ,
[g7Msg] varchar(150) NULL ,
[g8Msg] varchar(150) NULL ,
[g9Msg] varchar(150) NULL ,
[g10Msg] varchar(150) NULL ,
[g1Level] int NULL ,
[g2Level] int NULL ,
[g3Level] int NULL ,
[g4Level] int NULL ,
[g5Level] int NULL ,
[g6Level] int NULL ,
[g7Level] int NULL ,
[g8Level] int NULL ,
[g9Level] int NULL ,
[g10Level] int NULL ,
[cementState] int NULL DEFAULT ((0)) ,
[waterState] int NULL DEFAULT ((0)) ,
[cementLevel] int NULL DEFAULT ((0)) ,
[waterLevel] int NULL ,
[cementMsg] varchar(1000) NULL ,
[waterMsg] varchar(1000) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'元数据计算结果表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'元数据计算结果表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'stationId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'stationId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'stationId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'cement')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水泥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'cement'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水泥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'cement'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'water')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'water'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'water'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔1--0.075'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔1--0.075'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔2-0.15'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔2-0.15'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔3-0.3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔3-0.3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔4-0.6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔4-0.6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔5-1.18'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔5-1.18'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g6')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔6-2.36'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g6'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔6-2.36'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g6'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g7')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔7-4.75'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g7'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔7-4.75'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g7'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g8')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔8-9.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g8'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔8-9.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g8'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g9')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔9-13.2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g9'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔9-13.2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g9'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g10')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔10-16'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g10'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔10-16'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g10'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'batchCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'批次'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'batchCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'批次'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'batchCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'weight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'weight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'weight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'dataId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'元数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'dataId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'元数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'dataId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'levelSeries')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料配比曲线值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'levelSeries'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料配比曲线值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'levelSeries'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'formulaCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方编码值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'formulaCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方编码值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'formulaCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'aggregateLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料配比超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'aggregateLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料配比超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'aggregateLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'aggregateWeight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'aggregateWeight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'aggregateWeight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'isPass')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格-1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'isPass'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格-1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'isPass'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'excessMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'excessMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'excessMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g1State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g1State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g1State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g2State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g2State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g2State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g3State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g3State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g3State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g4State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g4State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g4State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g5State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g5State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g5State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g6State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g6State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g6State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g7State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g7State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g7State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g8State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g8State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g8State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g9State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g9State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g9State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'g10State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g10State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'g10State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_aggregate', 
'COLUMN', N'sieveVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔计算版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'sieveVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔计算版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_aggregate'
, @level2type = 'COLUMN', @level2name = N'sieveVersion'
GO

-- ----------------------------
-- Table structure for imp_water_metadata_result
-- ----------------------------
DROP TABLE [dbo].[imp_water_metadata_result]
GO
CREATE TABLE [dbo].[imp_water_metadata_result] (
[id] bigint NOT NULL ,
[stationId] bigint NULL ,
[formulaId] bigint NULL ,
[weight] decimal(12,2) NULL ,
[sieve1] decimal(12,2) NULL ,
[sieve2] decimal(12,2) NULL ,
[sieve3] decimal(12,2) NULL ,
[sieve4] decimal(12,2) NULL ,
[sieve5] decimal(12,2) NULL ,
[sieve6] decimal(12,2) NULL ,
[sieve7] decimal(12,2) NULL ,
[sieve8] decimal(12,2) NULL ,
[sieve9] decimal(12,2) NULL ,
[sieve10] decimal(12,2) NULL ,
[sieve11] decimal(12,2) NULL ,
[sieve12] decimal(12,2) NULL ,
[sieve13] decimal(12,2) NULL ,
[batchCode] varchar(150) NULL ,
[gradationLevel] int NULL ,
[isPass] int NULL ,
[dataId] bigint NULL ,
[excessMsg] varchar(1500) NULL ,
[sieve1State] int NULL ,
[sieve2State] int NULL ,
[sieve3State] int NULL ,
[sieve4State] int NULL ,
[sieve5State] int NULL ,
[sieve6State] int NULL ,
[sieve7State] int NULL ,
[sieve8State] int NULL ,
[sieve9State] int NULL ,
[sieve10State] int NULL ,
[sieve11State] int NULL ,
[sieve12State] int NULL ,
[sieve13State] int NULL ,
[formulaCode] varchar(100) NULL ,
[cement] decimal(6,2) NULL ,
[water] decimal(12,2) NULL ,
[aggregateWeight] decimal(12,2) NULL ,
[time] datetime NULL ,
[sieveVersion] int NULL ,
[sieve1Msg] varchar(150) NULL ,
[sieve2Msg] varchar(150) NULL ,
[sieve3Msg] varchar(150) NULL ,
[sieve4Msg] varchar(150) NULL ,
[sieve5Msg] varchar(150) NULL ,
[sieve6Msg] varchar(150) NULL ,
[sieve7Msg] varchar(150) NULL ,
[sieve8Msg] varchar(150) NULL ,
[sieve9Msg] varchar(150) NULL ,
[sieve10Msg] varchar(150) NULL ,
[sieve11Msg] varchar(150) NULL ,
[sieve12Msg] varchar(150) NULL ,
[sieve13Msg] varchar(150) NULL ,
[waterMsg] varchar(255) NULL ,
[cementMsg] varchar(255) NULL ,
[waterLevel] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'元数据计算结果表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'元数据计算结果表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'stationId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'stationId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'stationId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'weight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'weight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'weight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔1--0.075'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔1--0.075'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔2-0.15'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔2-0.15'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔3-0.3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔3-0.3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔4-0.6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔4-0.6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔5-1.18'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔5-1.18'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve6')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔6-2.36'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve6'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔6-2.36'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve6'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve7')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔7-4.75'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve7'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔7-4.75'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve7'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve8')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔8-9.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve8'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔8-9.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve8'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve9')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔9-13.2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve9'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔9-13.2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve9'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve10')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔10-16'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve10'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔10-16'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve10'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve11')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔11-19'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve11'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔11-19'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve11'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve12')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔12-26.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve12'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔12-26.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve12'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve13')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔13-34.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve13'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔13-34.5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve13'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'batchCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'批次'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'batchCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'批次'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'batchCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'gradationLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'级配超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'gradationLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'级配超标等级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'gradationLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'isPass')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格-1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'isPass'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否合格 0合格-1不合格'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'isPass'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'dataId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'元数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'dataId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'元数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'dataId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'excessMsg')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'excessMsg'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'excessMsg'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve1State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve1State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve1State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve2State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve2State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve2State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve3State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve3State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve3State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve4State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve4State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve4State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve5State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve5State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve5State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve6State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve6State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve6State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve7State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve7State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve7State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve8State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve8State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve8State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve9State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve9State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve9State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve10State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve10State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve10State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve11State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve11State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve11State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve12State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve12State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve12State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieve13State')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve13State'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'超标级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieve13State'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'formulaCode')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方编码值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'formulaCode'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方编码值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'formulaCode'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'cement')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水泥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'cement'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水泥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'cement'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'water')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'water'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'water'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'aggregateWeight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggregateWeight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'aggregateWeight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'生产时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_metadata_result', 
'COLUMN', N'sieveVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔计算版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieveVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔计算版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_metadata_result'
, @level2type = 'COLUMN', @level2name = N'sieveVersion'
GO

-- ----------------------------
-- Table structure for imp_water_push_setting
-- ----------------------------
DROP TABLE [dbo].[imp_water_push_setting]
GO
CREATE TABLE [dbo].[imp_water_push_setting] (
[id] bigint NOT NULL ,
[stationId] bigint NULL ,
[type] int NULL ,
[isOpen] int NULL ,
[phone] varchar(500) NULL ,
[level] int NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'通知设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'通知设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
'COLUMN', N'stationId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水稳站Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'stationId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水稳站Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'stationId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
'COLUMN', N'isOpen')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否开启 0开启1关闭'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'isOpen'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否开启 0开启1关闭'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'isOpen'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'手机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'手机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_push_setting', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_push_setting'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO

-- ----------------------------
-- Table structure for imp_water_sieve_setting
-- ----------------------------
DROP TABLE [dbo].[imp_water_sieve_setting]
GO
CREATE TABLE [dbo].[imp_water_sieve_setting] (
[id] bigint NOT NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[formulaId] bigint NULL ,
[level] int NULL ,
[formulaValue] decimal(12,2) NULL ,
[g1] decimal(12,2) NULL ,
[g2] decimal(12,2) NULL ,
[g3] decimal(12,2) NULL ,
[g4] decimal(12,2) NULL ,
[g5] decimal(12,2) NULL ,
[g6] decimal(12,2) NULL ,
[g7] decimal(12,2) NULL ,
[g8] decimal(12,2) NULL ,
[g9] decimal(12,2) NULL ,
[g10] decimal(12,2) NULL ,
[dataVersion] int NULL ,
[isVisible] int NULL ,
[firstHigh] decimal(12,2) NULL ,
[firstLow] decimal(12,2) NULL ,
[secondHigh] decimal(12,2) NULL ,
[secondLow] decimal(12,2) NULL ,
[threeHigh] decimal(12,2) NULL ,
[threeLow] decimal(12,2) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'筛孔级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'筛孔级别'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'formulaValue')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'formulaValue'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'formulaValue'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料1'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料2'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料3'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g4')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g4'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料4'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g4'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g5')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g5'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料5'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g5'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g6')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g6'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料6'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g6'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g7')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料7'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g7'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料7'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g7'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g8')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料8'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g8'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料8'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g8'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g9')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料9'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g9'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料9'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g9'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'g10')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料10'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g10'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料10'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'g10'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'dataVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'isVisible')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见 1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'isVisible'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见 1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'isVisible'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'firstHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'firstHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'firstHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_sieve_setting', 
'COLUMN', N'firstLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'firstLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_sieve_setting'
, @level2type = 'COLUMN', @level2name = N'firstLow'
GO

-- ----------------------------
-- Table structure for imp_water_warning_config
-- ----------------------------
DROP TABLE [dbo].[imp_water_warning_config]
GO
CREATE TABLE [dbo].[imp_water_warning_config] (
[id] bigint NOT NULL ,
[number] varchar(255) NULL ,
[lname] varchar(255) NULL ,
[formulaValue] decimal(10,2) NULL ,
[firstHigh] decimal(10,2) NULL ,
[firstLow] decimal(10,2) NULL ,
[secondHigh] decimal(10,2) NULL ,
[secondLow] decimal(10,2) NULL ,
[threeHigh] decimal(10,2) NULL ,
[threeLow] decimal(10,2) NULL ,
[updateTime] datetime NULL ,
[updateUser] bigint NULL ,
[formulaId] bigint NULL ,
[dataVersion] int NULL ,
[isVisible] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警设置表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'number')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'number'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'编号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'number'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'lname')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'lname'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'lname'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'formulaValue')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'目标值--配方值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'formulaValue'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'目标值--配方值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'formulaValue'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'firstHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'firstHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'firstHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'firstLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级下限制'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'firstLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级下限制'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'firstLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'secondHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'secondHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级上限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'secondHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'secondLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'secondLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'secondLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'threeHigh')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级上限制'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'threeHigh'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级上限制'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'threeHigh'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'threeLow')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'threeLow'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级下限值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'threeLow'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'updateUser')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'updateUser'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'updateUser'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'formulaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'formulaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'配方id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'formulaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'dataVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_config', 
'COLUMN', N'isVisible')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见 1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'isVisible'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据可见 0可见 1不可见'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_config'
, @level2type = 'COLUMN', @level2name = N'isVisible'
GO

-- ----------------------------
-- Table structure for imp_water_warning_message
-- ----------------------------
DROP TABLE [dbo].[imp_water_warning_message]
GO
CREATE TABLE [dbo].[imp_water_warning_message] (
[id] bigint NOT NULL ,
[dataId] bigint NULL ,
[createTime] datetime NULL ,
[content] varchar(1000) NULL ,
[type] varchar(100) NULL ,
[cement] decimal(12,2) NULL ,
[totalWeight] decimal(12,2) NULL ,
[stationId] bigint NULL ,
[water] decimal(12,2) NULL ,
[cementResult] int NULL ,
[cementMsg] varchar(1000) NULL ,
[waterResult] int NULL ,
[waterMsg] varchar(1000) NULL ,
[formulaId] bigint NULL ,
[formulaName] varchar(255) NULL ,
[aggregateResult] int NULL ,
[sieveResult] int NULL ,
[dataTime] datetime NULL ,
[dataVersion] int NULL ,
[dealStatus] int NULL DEFAULT NULL ,
[sendFlag] int NULL DEFAULT NULL ,
[returnKey] varchar(255) NULL DEFAULT NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警信息表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警信息表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'dataId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'dataId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'数据id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'dataId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'告警内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'告警内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'content'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'分类'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'cement')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水泥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'cement'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水泥'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'cement'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'totalWeight')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'totalWeight'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'总重量'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'totalWeight'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'stationId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'水稳拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'stationId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'水稳拌合站id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'stationId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'dataVersion')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'骨料配比版本号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'骨料配比版本号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'dataVersion'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'dealStatus')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'预警处理状态 '
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'dealStatus'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'预警处理状态 '
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'dealStatus'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'sendFlag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'质监局发送标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'sendFlag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'质监局发送标识'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'sendFlag'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_message', 
'COLUMN', N'returnKey')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'质监局返回key'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'returnKey'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'质监局返回key'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_message'
, @level2type = 'COLUMN', @level2name = N'returnKey'
GO

-- ----------------------------
-- Table structure for imp_water_warning_note_config
-- ----------------------------
DROP TABLE [dbo].[imp_water_warning_note_config]
GO
CREATE TABLE [dbo].[imp_water_warning_note_config] (
[id] bigint NOT NULL ,
[projectId] bigint NULL ,
[orgId] varchar(255) NULL ,
[stationId] varchar(1000) NULL ,
[userId] bigint NULL ,
[userName] varchar(255) NULL ,
[phone] varchar(255) NULL ,
[level1] int NULL ,
[level2] int NULL ,
[level3] int NULL ,
[isOpen] int NULL ,
[type] int NULL ,
[remark] varchar(500) NULL ,
[stationNames] varchar(1000) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'李轻沾报警短信配置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'李轻沾报警短信配置'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标段Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标段Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'userId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'userId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'userId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'userName')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'用户名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'userName'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'用户名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'userName'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'phone')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'接收电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'phone'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'接收电话'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'phone'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'level1')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'一级接受开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level1'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'一级接受开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level1'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'level2')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'二级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level2'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'二级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level2'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'level3')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'三级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level3'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'三级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'level3'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'isOpen')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'isOpen'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'开关'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'isOpen'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'imp_water_warning_note_config', 
'COLUMN', N'stationNames')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'拌合机名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'stationNames'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'拌合机名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'imp_water_warning_note_config'
, @level2type = 'COLUMN', @level2name = N'stationNames'
GO

-- ----------------------------
-- Table structure for tbl_car
-- ----------------------------
DROP TABLE [dbo].[tbl_car]
GO
CREATE TABLE [dbo].[tbl_car] (
[id] bigint NOT NULL ,
[sid] varchar(32) NULL ,
[name] varchar(255) NULL ,
[width] real NULL ,
[orgId] bigint NULL ,
[carType] int NULL ,
[crafts] int NULL ,
[workAreaId] bigint NULL ,
[workTime] datetime2(7) NULL ,
[moveTime] datetime2(7) NULL ,
[status] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'摊铺压路车辆'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摊铺压路车辆'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'sid')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'sid'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'sid'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'width')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'宽度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'width'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'宽度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'width'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织架构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织架构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'carType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'carType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'carType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'crafts')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工艺'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'crafts'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工艺'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'crafts'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'workAreaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工区ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'workAreaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工区ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'workAreaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'workTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工作时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'workTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工作时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'workTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'moveTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'转场时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'moveTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'转场时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'moveTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_car', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_car'
, @level2type = 'COLUMN', @level2name = N'status'
GO

-- ----------------------------
-- Table structure for tbl_craft_detail
-- ----------------------------
DROP TABLE [dbo].[tbl_craft_detail]
GO
CREATE TABLE [dbo].[tbl_craft_detail] (
[id] bigint NOT NULL ,
[craftLayerId] bigint NOT NULL ,
[craft] int NULL ,
[carType] int NULL ,
[thickness] decimal(8,2) NULL ,
[speedMin] decimal(8,2) NULL ,
[tempMin] int NULL ,
[tempMax] int NULL ,
[timesMin] int NULL ,
[timesMax] int NULL ,
[enabled] int NULL ,
[speedMax] decimal(8,2) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工艺明细表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工艺明细表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'craftLayerId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工艺层级ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'craftLayerId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工艺层级ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'craftLayerId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'craft')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工艺类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'craft'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工艺类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'craft'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'carType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'车辆类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'carType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'车辆类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'carType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'thickness')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'摊铺厚度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'thickness'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摊铺厚度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'thickness'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'speedMin')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'速度最小值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'speedMin'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'速度最小值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'speedMin'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'tempMin')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'温度最小值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'tempMin'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'温度最小值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'tempMin'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'tempMax')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'温度最大值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'tempMax'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'温度最大值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'tempMax'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'timesMin')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'遍数最小值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'timesMin'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'遍数最小值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'timesMin'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'timesMax')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'遍数最大值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'timesMax'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'遍数最大值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'timesMax'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'enabled')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'启用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'enabled'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'启用'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'enabled'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_detail', 
'COLUMN', N'speedMax')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'速度最大值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'speedMax'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'速度最大值'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_detail'
, @level2type = 'COLUMN', @level2name = N'speedMax'
GO

-- ----------------------------
-- Table structure for tbl_craft_layer
-- ----------------------------
DROP TABLE [dbo].[tbl_craft_layer]
GO
CREATE TABLE [dbo].[tbl_craft_layer] (
[id] bigint NOT NULL ,
[index] int NULL ,
[materialType] int NULL ,
[layer] int NULL ,
[version] varchar(255) NULL ,
[orgId] bigint NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_layer', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工艺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工艺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_layer', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_layer', 
'COLUMN', N'index')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'index'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'序号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'index'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_layer', 
'COLUMN', N'materialType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'材料类型（0：水稳，1:沥青）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'materialType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'材料类型（0：水稳，1:沥青）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'materialType'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_layer', 
'COLUMN', N'layer')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工艺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'layer'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工艺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'layer'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_layer', 
'COLUMN', N'version')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工艺版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'version'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工艺版本'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'version'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_craft_layer', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标段Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标段Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_craft_layer'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO

-- ----------------------------
-- Table structure for tbl_device_data
-- ----------------------------
DROP TABLE [dbo].[tbl_device_data]
GO
CREATE TABLE [dbo].[tbl_device_data] (
[id] bigint NOT NULL ,
[time] datetime2(7) NULL ,
[content] varchar(1024) NULL ,
[flag] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_device_data', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备上报原始字符串'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备上报原始字符串'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_device_data', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_device_data', 
'COLUMN', N'time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'服务器接收时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
, @level2type = 'COLUMN', @level2name = N'time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'服务器接收时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
, @level2type = 'COLUMN', @level2name = N'time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_device_data', 
'COLUMN', N'content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
, @level2type = 'COLUMN', @level2name = N'content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
, @level2type = 'COLUMN', @level2name = N'content'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_device_data', 
'COLUMN', N'flag')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
, @level2type = 'COLUMN', @level2name = N'flag'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标记'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_device_data'
, @level2type = 'COLUMN', @level2name = N'flag'
GO

-- ----------------------------
-- Table structure for tbl_gps_data
-- ----------------------------
DROP TABLE [dbo].[tbl_gps_data]
GO
CREATE TABLE [dbo].[tbl_gps_data] (
[id] bigint NOT NULL ,
[sid] varchar(64) NULL ,
[lon] decimal(16,10) NULL ,
[lat] decimal(16,10) NULL ,
[hi] decimal(16,3) NULL ,
[drct] decimal(16,10) NULL ,
[speed] decimal(16,10) NULL ,
[temperature] int NULL ,
[mile] int NULL ,
[dmod] int NULL ,
[gps_time] datetime2(7) NULL ,
[vibrate_type] int NULL ,
[groupId] bigint NULL ,
[layer] int NULL ,
[crafts] int NULL ,
[carId] bigint NULL ,
[workAreaId] bigint NULL ,
[distance] decimal(16,10) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ENH绘图数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ENH绘图数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'sid')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'sid'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'sid'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'lon')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'lon'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'lon'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'lat')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'lat'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'lat'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'hi')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'高线'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'hi'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'高线'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'hi'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'drct')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'方向'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'drct'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'方向'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'drct'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'speed')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'速度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'speed'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'速度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'speed'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'temperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'temperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'temperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'mile')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'英里'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'mile'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'英里'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'mile'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'dmod')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'模型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'dmod'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'模型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'dmod'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'gps_time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上报时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'gps_time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上报时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'gps_time'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'vibrate_type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'震动类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'vibrate_type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'震动类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'vibrate_type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'groupId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'groupId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'groupId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'layer')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工作层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'layer'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工作层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'layer'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'crafts')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工艺'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'crafts'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工艺'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'crafts'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'carId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'施工车辆Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'carId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'施工车辆Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'carId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'workAreaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工区ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'workAreaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工区ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'workAreaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data', 
'COLUMN', N'distance')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上一点距离'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'distance'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上一点距离'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data'
, @level2type = 'COLUMN', @level2name = N'distance'
GO

-- ----------------------------
-- Table structure for tbl_gps_data_group
-- ----------------------------
DROP TABLE [dbo].[tbl_gps_data_group]
GO
CREATE TABLE [dbo].[tbl_gps_data_group] (
[id] bigint NOT NULL ,
[date] date NULL ,
[startStake] varchar(255) NULL ,
[endStake] varchar(255) NULL ,
[material] decimal(8,3) NULL ,
[orgId] bigint NULL ,
[layer] int NULL ,
[workAreaId] bigint NULL ,
[startTime] date NULL ,
[endTime] date NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'摊铺统计'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摊铺统计'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'date')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'date'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'日期'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'date'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'startStake')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'起始桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'startStake'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'起始桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'startStake'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'endStake')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'结束桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'endStake'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'结束桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'endStake'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'material')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'出料总数（吨）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'material'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'出料总数（吨）'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'material'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'layer')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'摊铺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'layer'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'摊铺层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'layer'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'workAreaId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工区Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'workAreaId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工区Id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'workAreaId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'startTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'startTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'startTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_data_group', 
'COLUMN', N'endTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'endTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'结束时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_data_group'
, @level2type = 'COLUMN', @level2name = N'endTime'
GO

-- ----------------------------
-- Table structure for tbl_gps_original_data
-- ----------------------------
DROP TABLE [dbo].[tbl_gps_original_data]
GO
CREATE TABLE [dbo].[tbl_gps_original_data] (
[id] bigint NOT NULL ,
[sid] varchar(64) NULL ,
[lon] decimal(16,10) NULL ,
[lat] decimal(16,10) NULL ,
[hi] decimal(16,3) NULL ,
[temperature] int NULL ,
[gps_time] datetime2(7) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_original_data', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'原始gps数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'原始gps数据'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_original_data', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_original_data', 
'COLUMN', N'sid')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'设备ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'sid'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'设备ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'sid'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_original_data', 
'COLUMN', N'lon')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'lon'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'lon'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_original_data', 
'COLUMN', N'lat')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'lat'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'lat'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_original_data', 
'COLUMN', N'hi')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'高线'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'hi'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'高线'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'hi'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_original_data', 
'COLUMN', N'temperature')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'temperature'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'温度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'temperature'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_gps_original_data', 
'COLUMN', N'gps_time')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'上报时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'gps_time'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'上报时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_gps_original_data'
, @level2type = 'COLUMN', @level2name = N'gps_time'
GO

-- ----------------------------
-- Table structure for tbl_hc_data
-- ----------------------------
DROP TABLE [dbo].[tbl_hc_data]
GO
CREATE TABLE [dbo].[tbl_hc_data] (
[id] bigint NOT NULL ,
[content] varchar(1024) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_hc_data', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_hc_data'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_hc_data'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_hc_data', 
'COLUMN', N'content')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_hc_data'
, @level2type = 'COLUMN', @level2name = N'content'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'内容'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_hc_data'
, @level2type = 'COLUMN', @level2name = N'content'
GO

-- ----------------------------
-- Table structure for tbl_stake
-- ----------------------------
DROP TABLE [dbo].[tbl_stake]
GO
CREATE TABLE [dbo].[tbl_stake] (
[id] bigint NOT NULL IDENTITY(1,1) ,
[stakeGroupId] bigint NULL ,
[stakeNo] varchar(32) NULL ,
[x] decimal(18,4) NULL ,
[y] decimal(18,4) NULL ,
[lon] decimal(18,10) NULL ,
[lat] decimal(18,10) NULL ,
[mile] int NULL ,
[leftLayer] decimal(8,2) NULL ,
[leftUpperLevel] decimal(8,2) NULL ,
[leftLowestLevel] decimal(8,2) NULL ,
[leftSubbase] decimal(8,2) NULL ,
[rightLayer] decimal(8,2) NULL ,
[rightUpperLevel] decimal(8,2) NULL ,
[rightLowestLevel] decimal(8,2) NULL ,
[rightSubbase] decimal(8,2) NULL ,
[stakeType] varchar(15) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[tbl_stake]', RESEED, 33053)
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'桩号详情列表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'桩号详情列表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'stakeGroupId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'路段桩号ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'stakeGroupId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'路段桩号ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'stakeGroupId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'stakeNo')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'stakeNo'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'stakeNo'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'x')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'北京54-x'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'x'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'北京54-x'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'x'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'y')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'北京54-y'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'y'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'北京54-y'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'y'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'lon')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'WGS84_经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'lon'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'WGS84_经度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'lon'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'lat')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'WGS84_纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'lat'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'WGS84_纬度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'lat'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'mile')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'桩号里程'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'mile'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'桩号里程'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'mile'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'leftLayer')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'左面层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'leftLayer'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'左面层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'leftLayer'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'leftUpperLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'左上基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'leftUpperLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'左上基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'leftUpperLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'leftLowestLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'左下基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'leftLowestLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'左下基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'leftLowestLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'leftSubbase')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'左底基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'leftSubbase'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'左底基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'leftSubbase'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'rightLayer')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'右面层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'rightLayer'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'右面层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'rightLayer'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'rightUpperLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'右上基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'rightUpperLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'右上基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'rightUpperLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'rightLowestLevel')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'右下基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'rightLowestLevel'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'右下基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'rightLowestLevel'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'rightSubbase')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'右底基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'rightSubbase'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'右底基层'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'rightSubbase'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake', 
'COLUMN', N'stakeType')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'桩号类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'stakeType'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'桩号类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake'
, @level2type = 'COLUMN', @level2name = N'stakeType'
GO

-- ----------------------------
-- Table structure for tbl_stake_group
-- ----------------------------
DROP TABLE [dbo].[tbl_stake_group]
GO
CREATE TABLE [dbo].[tbl_stake_group] (
[id] bigint NOT NULL ,
[orgId] bigint NULL ,
[startStake] decimal(10,4) NULL ,
[endStake] decimal(10,4) NULL ,
[width] decimal(8,2) NULL ,
[name] varchar(255) NULL ,
[type] varchar(15) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake_group', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'路段桩号表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'路段桩号表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake_group', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake_group', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织架构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织架构id'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake_group', 
'COLUMN', N'startStake')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'开始桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'startStake'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'开始桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'startStake'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake_group', 
'COLUMN', N'endStake')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'结束桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'endStake'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'结束桩号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'endStake'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake_group', 
'COLUMN', N'width')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'宽度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'width'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'宽度'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'width'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake_group', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_stake_group', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'桩号类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'桩号类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_stake_group'
, @level2type = 'COLUMN', @level2name = N'type'
GO

-- ----------------------------
-- Table structure for tbl_trimble_info
-- ----------------------------
DROP TABLE [dbo].[tbl_trimble_info]
GO
CREATE TABLE [dbo].[tbl_trimble_info] (
[id] bigint NOT NULL ,
[sn] varchar(64) NULL ,
[orgId] bigint NULL ,
[brand] int NULL ,
[remark] varchar(64) NULL ,
[type] int NULL ,
[mac] varchar(32) NULL ,
[mobile] varchar(32) NULL ,
[status] int NULL ,
[createUserId] bigint NULL ,
[createTime] datetime2(7) NULL ,
[lastOnlineTime] datetime2(7) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'移动端基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'移动端基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'sn')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'SN'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'sn'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'SN'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'sn'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'brand')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'品牌'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'brand'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'品牌'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'brand'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'remark')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'remark'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'备注'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'remark'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'mac')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'mac地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'mac'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'mac地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'mac'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'mobile')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'手机卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'mobile'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'手机卡号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'mobile'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'createUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'createUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'createUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_trimble_info', 
'COLUMN', N'lastOnlineTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'最后一次上线时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'lastOnlineTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最后一次上线时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_trimble_info'
, @level2type = 'COLUMN', @level2name = N'lastOnlineTime'
GO

-- ----------------------------
-- Table structure for tbl_work_area
-- ----------------------------
DROP TABLE [dbo].[tbl_work_area]
GO
CREATE TABLE [dbo].[tbl_work_area] (
[id] bigint NOT NULL ,
[orgId] bigint NULL ,
[name] varchar(255) NULL ,
[level] int NULL ,
[updateTime] datetime2(7) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_area', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工区表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工区表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_area', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_area', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'标段ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'标段ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_area', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工区名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工区名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_area', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工作层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工作层级'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_area', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_area'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO

-- ----------------------------
-- Table structure for tbl_work_level
-- ----------------------------
DROP TABLE [dbo].[tbl_work_level]
GO
CREATE TABLE [dbo].[tbl_work_level] (
[id] bigint NOT NULL ,
[orgId] bigint NULL ,
[level] int NULL ,
[updateTime] datetime2(7) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_level', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工作层面表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工作层面表'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_level', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_level', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_level', 
'COLUMN', N'level')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'工作层面'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
, @level2type = 'COLUMN', @level2name = N'level'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'工作层面'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
, @level2type = 'COLUMN', @level2name = N'level'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tbl_work_level', 
'COLUMN', N'updateTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
, @level2type = 'COLUMN', @level2name = N'updateTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'更新时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tbl_work_level'
, @level2type = 'COLUMN', @level2name = N'updateTime'
GO

-- ----------------------------
-- Table structure for trimble_group
-- ----------------------------
DROP TABLE [dbo].[trimble_group]
GO
CREATE TABLE [dbo].[trimble_group] (
[id] bigint NOT NULL ,
[orgId] bigint NULL ,
[name] varchar(255) NULL ,
[createTime] datetime2(7) NULL ,
[createUserId] bigint NULL ,
[status] int NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_group', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'移动端组'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'移动端组'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_group', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_group', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_group', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_group', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_group', 
'COLUMN', N'createUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'createUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'createUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_group', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_group'
, @level2type = 'COLUMN', @level2name = N'status'
GO

-- ----------------------------
-- Table structure for trimble_info
-- ----------------------------
DROP TABLE [dbo].[trimble_info]
GO
CREATE TABLE [dbo].[trimble_info] (
[id] varchar(64) NOT NULL ,
[orgId] bigint NULL ,
[groupId] bigint NULL ,
[name] varchar(255) NULL ,
[type] int NULL ,
[mac] varchar(64) NULL ,
[mobile] varchar(64) NULL ,
[status] int NULL ,
[createTime] datetime2(7) NULL ,
[createUserId] bigint NULL ,
[lastOnlineTime] datetime2(7) NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
NULL, NULL)) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'移动端基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'移动端基础信息'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'ID(板卡序列号)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ID(板卡序列号)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'orgId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组织机构ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'orgId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'groupId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'组ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'groupId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'组ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'groupId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'name')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'name'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'名称'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'name'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'类型'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'mac')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'mac地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'mac'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'mac地址'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'mac'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'mobile')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'手机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'mobile'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'手机号'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'mobile'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'status')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'status'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'状态'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'status'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'createTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'createTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'createTime'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'createUserId')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'创建人ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'createUserId'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'创建人ID'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'createUserId'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'trimble_info', 
'COLUMN', N'lastOnlineTime')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'最后一次上线时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'lastOnlineTime'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'最后一次上线时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'trimble_info'
, @level2type = 'COLUMN', @level2name = N'lastOnlineTime'
GO

-- ----------------------------
-- Indexes structure for table ACT_EVT_LOG
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_EVT_LOG
-- ----------------------------
ALTER TABLE [dbo].[ACT_EVT_LOG] ADD PRIMARY KEY ([LOG_NR_])
GO

-- ----------------------------
-- Indexes structure for table ACT_GE_BYTEARRAY
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE [dbo].[ACT_GE_BYTEARRAY] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_GE_PROPERTY
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_GE_PROPERTY
-- ----------------------------
ALTER TABLE [dbo].[ACT_GE_PROPERTY] ADD PRIMARY KEY ([NAME_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_ACTINST
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_ACT_INST_START] ON [dbo].[ACT_HI_ACTINST]
([START_TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_ACT_INST_END] ON [dbo].[ACT_HI_ACTINST]
([END_TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_ACT_INST_PROCINST] ON [dbo].[ACT_HI_ACTINST]
([PROC_INST_ID_] ASC, [ACT_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_ACT_INST_EXEC] ON [dbo].[ACT_HI_ACTINST]
([EXECUTION_ID_] ASC, [ACT_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_ACTINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_ACTINST] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_ATTACHMENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_HI_ATTACHMENT
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_ATTACHMENT] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_COMMENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_HI_COMMENT
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_COMMENT] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_DETAIL
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_DETAIL_PROC_INST] ON [dbo].[ACT_HI_DETAIL]
([PROC_INST_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_DETAIL_ACT_INST] ON [dbo].[ACT_HI_DETAIL]
([ACT_INST_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_DETAIL_TIME] ON [dbo].[ACT_HI_DETAIL]
([TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_DETAIL_NAME] ON [dbo].[ACT_HI_DETAIL]
([NAME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_DETAIL_TASK_ID] ON [dbo].[ACT_HI_DETAIL]
([TASK_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_DETAIL
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_DETAIL] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_IDENTITYLINK
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_IDENT_LNK_USER] ON [dbo].[ACT_HI_IDENTITYLINK]
([USER_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_IDENT_LNK_TASK] ON [dbo].[ACT_HI_IDENTITYLINK]
([TASK_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_IDENT_LNK_PROCINST] ON [dbo].[ACT_HI_IDENTITYLINK]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_IDENTITYLINK
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_IDENTITYLINK] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_PROCINST
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_PRO_INST_END] ON [dbo].[ACT_HI_PROCINST]
([END_TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_PRO_I_BUSKEY] ON [dbo].[ACT_HI_PROCINST]
([BUSINESS_KEY_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_PROCINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_PROCINST] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Uniques structure for table ACT_HI_PROCINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_PROCINST] ADD UNIQUE ([PROC_INST_ID_] ASC)
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_TASKINST
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_TASK_INST_PROCINST] ON [dbo].[ACT_HI_TASKINST]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_TASKINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_TASKINST] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_HI_VARINST
-- ----------------------------
CREATE INDEX [ACT_IDX_HI_PROCVAR_PROC_INST] ON [dbo].[ACT_HI_VARINST]
([PROC_INST_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_PROCVAR_NAME_TYPE] ON [dbo].[ACT_HI_VARINST]
([NAME_] ASC, [VAR_TYPE_] ASC) 
GO
CREATE INDEX [ACT_IDX_HI_PROCVAR_TASK_ID] ON [dbo].[ACT_HI_VARINST]
([TASK_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_HI_VARINST
-- ----------------------------
ALTER TABLE [dbo].[ACT_HI_VARINST] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_ID_GROUP
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_GROUP
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_GROUP] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_ID_INFO
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_INFO
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_INFO] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_ID_MEMBERSHIP
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_MEMBERSHIP
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP] ADD PRIMARY KEY ([USER_ID_], [GROUP_ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_ID_USER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_USER
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_USER] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_PROCDEF_INFO
-- ----------------------------
CREATE INDEX [ACT_IDX_INFO_PROCDEF] ON [dbo].[ACT_PROCDEF_INFO]
([PROC_DEF_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_PROCDEF_INFO
-- ----------------------------
ALTER TABLE [dbo].[ACT_PROCDEF_INFO] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Uniques structure for table ACT_PROCDEF_INFO
-- ----------------------------
ALTER TABLE [dbo].[ACT_PROCDEF_INFO] ADD UNIQUE ([PROC_DEF_ID_] ASC)
GO

-- ----------------------------
-- Indexes structure for table ACT_RE_DEPLOYMENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_RE_DEPLOYMENT
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_DEPLOYMENT] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RE_MODEL
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_RE_MODEL
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RE_PROCDEF
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_RE_PROCDEF
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_PROCDEF] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Uniques structure for table ACT_RE_PROCDEF
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_PROCDEF] ADD UNIQUE ([KEY_] ASC, [VERSION_] ASC, [TENANT_ID_] ASC)
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_EVENT_SUBSCR
-- ----------------------------
CREATE INDEX [ACT_IDX_EVENT_SUBSCR_CONFIG_] ON [dbo].[ACT_RU_EVENT_SUBSCR]
([CONFIGURATION_] ASC) 
GO
CREATE INDEX [ACT_IDX_EVENT_SUBSCR_EXEC_ID] ON [dbo].[ACT_RU_EVENT_SUBSCR]
([EXECUTION_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_EVENT_SUBSCR] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_EXECUTION
-- ----------------------------
CREATE INDEX [ACT_IDX_EXEC_BUSKEY] ON [dbo].[ACT_RU_EXECUTION]
([BUSINESS_KEY_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXECUTION_PROC] ON [dbo].[ACT_RU_EXECUTION]
([PROC_DEF_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXECUTION_PARENT] ON [dbo].[ACT_RU_EXECUTION]
([PARENT_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXECUTION_SUPER] ON [dbo].[ACT_RU_EXECUTION]
([SUPER_EXEC_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXECUTION_IDANDREV] ON [dbo].[ACT_RU_EXECUTION]
([ID_] ASC, [REV_] ASC) 
GO
CREATE INDEX [ACT_IDX_EXEC_PROC_INST_ID] ON [dbo].[ACT_RU_EXECUTION]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_EXECUTION
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_IDENTITYLINK
-- ----------------------------
CREATE INDEX [ACT_IDX_IDENT_LNK_USER] ON [dbo].[ACT_RU_IDENTITYLINK]
([USER_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_IDENT_LNK_GROUP] ON [dbo].[ACT_RU_IDENTITYLINK]
([GROUP_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_ATHRZ_PROCEDEF] ON [dbo].[ACT_RU_IDENTITYLINK]
([PROC_DEF_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_IDENT_LNK_TASK] ON [dbo].[ACT_RU_IDENTITYLINK]
([TASK_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_IDENT_LNK_PROCINST] ON [dbo].[ACT_RU_IDENTITYLINK]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_IDENTITYLINK
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_JOB
-- ----------------------------
CREATE INDEX [ACT_IDX_JOB_EXCEPTION_STACK_ID] ON [dbo].[ACT_RU_JOB]
([EXCEPTION_STACK_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_JOB
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_JOB] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_TASK
-- ----------------------------
CREATE INDEX [ACT_IDX_TASK_CREATE] ON [dbo].[ACT_RU_TASK]
([CREATE_TIME_] ASC) 
GO
CREATE INDEX [ACT_IDX_TASK_EXEC] ON [dbo].[ACT_RU_TASK]
([EXECUTION_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_TASK_PROCINST] ON [dbo].[ACT_RU_TASK]
([PROC_INST_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_TASK_PROC_DEF_ID] ON [dbo].[ACT_RU_TASK]
([PROC_DEF_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_TASK
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_TASK] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table ACT_RU_VARIABLE
-- ----------------------------
CREATE INDEX [ACT_IDX_VARIABLE_TASK_ID] ON [dbo].[ACT_RU_VARIABLE]
([TASK_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_VARIABLE_BA] ON [dbo].[ACT_RU_VARIABLE]
([BYTEARRAY_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_VARIABLE_EXEC] ON [dbo].[ACT_RU_VARIABLE]
([EXECUTION_ID_] ASC) 
GO
CREATE INDEX [ACT_IDX_VARIABLE_PROCINST] ON [dbo].[ACT_RU_VARIABLE]
([PROC_INST_ID_] ASC) 
GO

-- ----------------------------
-- Primary Key structure for table ACT_RU_VARIABLE
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_VARIABLE] ADD PRIMARY KEY ([ID_])
GO

-- ----------------------------
-- Indexes structure for table bhz_mixingMachine
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table bhz_mixingMachine
-- ----------------------------
ALTER TABLE [dbo].[bhz_mixingMachine] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_alarm_deal
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_alarm_deal
-- ----------------------------
ALTER TABLE [dbo].[imp_alarm_deal] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_asphalt_formula
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_asphalt_formula
-- ----------------------------
ALTER TABLE [dbo].[imp_asphalt_formula] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_asphalt_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_asphalt_info
-- ----------------------------
ALTER TABLE [dbo].[imp_asphalt_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_asphalt_metadata
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_asphalt_metadata
-- ----------------------------
ALTER TABLE [dbo].[imp_asphalt_metadata] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_asphalt_metadata_result
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_asphalt_metadata_result
-- ----------------------------
ALTER TABLE [dbo].[imp_asphalt_metadata_result] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_asphalt_push_setting
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_asphalt_push_setting
-- ----------------------------
ALTER TABLE [dbo].[imp_asphalt_push_setting] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_asphalt_sieve_setting
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_asphalt_sieve_setting
-- ----------------------------
ALTER TABLE [dbo].[imp_asphalt_sieve_setting] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_asphalt_warning_config
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_asphalt_warning_config
-- ----------------------------
ALTER TABLE [dbo].[imp_asphalt_warning_config] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_asphalt_warning_note_config
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_asphalt_warning_note_config
-- ----------------------------
ALTER TABLE [dbo].[imp_asphalt_warning_note_config] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_alamMessage
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_alamMessage
-- ----------------------------
ALTER TABLE [dbo].[imp_car_alamMessage] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_alarm
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_alarm
-- ----------------------------
ALTER TABLE [dbo].[imp_car_alarm] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_carClient
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_carClient
-- ----------------------------
ALTER TABLE [dbo].[imp_car_carClient] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_deleteElectricfence
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_deleteElectricfence
-- ----------------------------
ALTER TABLE [dbo].[imp_car_deleteElectricfence] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_electricFence
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_electricFence
-- ----------------------------
ALTER TABLE [dbo].[imp_car_electricFence] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_fenceRecord
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_fenceRecord
-- ----------------------------
ALTER TABLE [dbo].[imp_car_fenceRecord] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_position
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_position
-- ----------------------------
ALTER TABLE [dbo].[imp_car_position] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_position_201901
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_position_201901
-- ----------------------------
ALTER TABLE [dbo].[imp_car_position_201901] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_status
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_status
-- ----------------------------
ALTER TABLE [dbo].[imp_car_status] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_car_vehicleManagement
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_car_vehicleManagement
-- ----------------------------
ALTER TABLE [dbo].[imp_car_vehicleManagement] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_code_type
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_code_type
-- ----------------------------
ALTER TABLE [dbo].[imp_code_type] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_continuous_warning
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_continuous_warning
-- ----------------------------
ALTER TABLE [dbo].[imp_continuous_warning] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_continuous_warning_Record
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_continuous_warning_Record
-- ----------------------------
ALTER TABLE [dbo].[imp_continuous_warning_Record] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_machine_phone_note_record
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_machine_phone_note_record
-- ----------------------------
ALTER TABLE [dbo].[imp_machine_phone_note_record] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_org_link
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_org_link
-- ----------------------------
ALTER TABLE [dbo].[imp_org_link] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_organization
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_organization
-- ----------------------------
ALTER TABLE [dbo].[imp_organization] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_radiofrequency_data
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_radiofrequency_data
-- ----------------------------
ALTER TABLE [dbo].[imp_radiofrequency_data] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_resource
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_resource
-- ----------------------------
ALTER TABLE [dbo].[imp_resource] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Triggers structure for table imp_resource
-- ----------------------------
DROP TRIGGER [dbo].[auto_insert_index]
GO
CREATE TRIGGER [dbo].[auto_insert_index]
ON [dbo].[imp_resource]
AFTER INSERT
AS
BEGIN
        declare @id bigint, @orderNum int;
        select @id=id from inserted;
        select @orderNum = max([orderNum])  from imp_resource;
        if (@orderNum is null )
        begin
              set @orderNum = 0;
        end
        update imp_resource set [orderNum] = @orderNum +1 where id=@id ;
    END
GO

-- ----------------------------
-- Indexes structure for table imp_role
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_role
-- ----------------------------
ALTER TABLE [dbo].[imp_role] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_role_group
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_role_group
-- ----------------------------
ALTER TABLE [dbo].[imp_role_group] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_role_resource_link
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_role_resource_link
-- ----------------------------
ALTER TABLE [dbo].[imp_role_resource_link] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_transport_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_transport_info
-- ----------------------------
ALTER TABLE [dbo].[imp_transport_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_user
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_user
-- ----------------------------
ALTER TABLE [dbo].[imp_user] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_user_org_link
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_user_org_link
-- ----------------------------
ALTER TABLE [dbo].[imp_user_org_link] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_user_role_link
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_user_role_link
-- ----------------------------
ALTER TABLE [dbo].[imp_user_role_link] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_formula
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_formula
-- ----------------------------
ALTER TABLE [dbo].[imp_water_formula] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_info
-- ----------------------------
ALTER TABLE [dbo].[imp_water_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_info_copy
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_info_copy
-- ----------------------------
ALTER TABLE [dbo].[imp_water_info_copy] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_metadata
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_metadata
-- ----------------------------
ALTER TABLE [dbo].[imp_water_metadata] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_metadata_aggregate
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_metadata_aggregate
-- ----------------------------
ALTER TABLE [dbo].[imp_water_metadata_aggregate] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_metadata_result
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_metadata_result
-- ----------------------------
ALTER TABLE [dbo].[imp_water_metadata_result] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_push_setting
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_push_setting
-- ----------------------------
ALTER TABLE [dbo].[imp_water_push_setting] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_sieve_setting
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_sieve_setting
-- ----------------------------
ALTER TABLE [dbo].[imp_water_sieve_setting] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_warning_config
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_warning_config
-- ----------------------------
ALTER TABLE [dbo].[imp_water_warning_config] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_warning_message
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_warning_message
-- ----------------------------
ALTER TABLE [dbo].[imp_water_warning_message] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table imp_water_warning_note_config
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table imp_water_warning_note_config
-- ----------------------------
ALTER TABLE [dbo].[imp_water_warning_note_config] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table tbl_car
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_car
-- ----------------------------
ALTER TABLE [dbo].[tbl_car] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table tbl_craft_detail
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_craft_detail
-- ----------------------------
ALTER TABLE [dbo].[tbl_craft_detail] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table tbl_craft_layer
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_craft_layer
-- ----------------------------
ALTER TABLE [dbo].[tbl_craft_layer] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table tbl_device_data
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_device_data
-- ----------------------------
ALTER TABLE [dbo].[tbl_device_data] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table tbl_gps_data
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_gps_data
-- ----------------------------
ALTER TABLE [dbo].[tbl_gps_data] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table tbl_gps_data_group
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_gps_data_group
-- ----------------------------
ALTER TABLE [dbo].[tbl_gps_data_group] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table tbl_gps_original_data
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_gps_original_data
-- ----------------------------
ALTER TABLE [dbo].[tbl_gps_original_data] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table tbl_hc_data
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_hc_data
-- ----------------------------
ALTER TABLE [dbo].[tbl_hc_data] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table tbl_stake
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_stake
-- ----------------------------
ALTER TABLE [dbo].[tbl_stake] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table tbl_stake_group
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_stake_group
-- ----------------------------
ALTER TABLE [dbo].[tbl_stake_group] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table tbl_trimble_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_trimble_info
-- ----------------------------
ALTER TABLE [dbo].[tbl_trimble_info] ADD PRIMARY KEY ([id])
GO

-- ----------------------------
-- Indexes structure for table tbl_work_area
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_work_area
-- ----------------------------
ALTER TABLE [dbo].[tbl_work_area] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table tbl_work_level
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbl_work_level
-- ----------------------------
ALTER TABLE [dbo].[tbl_work_level] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table trimble_group
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table trimble_group
-- ----------------------------
ALTER TABLE [dbo].[trimble_group] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Indexes structure for table trimble_info
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table trimble_info
-- ----------------------------
ALTER TABLE [dbo].[trimble_info] ADD PRIMARY KEY ([id]) WITH (ALLOW_ROW_LOCKS=OFF, ALLOW_PAGE_LOCKS=OFF)
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_GE_BYTEARRAY]
-- ----------------------------
ALTER TABLE [dbo].[ACT_GE_BYTEARRAY] ADD FOREIGN KEY ([DEPLOYMENT_ID_]) REFERENCES [dbo].[ACT_RE_DEPLOYMENT] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_ID_MEMBERSHIP]
-- ----------------------------
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP] ADD FOREIGN KEY ([GROUP_ID_]) REFERENCES [dbo].[ACT_ID_GROUP] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_ID_MEMBERSHIP] ADD FOREIGN KEY ([USER_ID_]) REFERENCES [dbo].[ACT_ID_USER] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_PROCDEF_INFO]
-- ----------------------------
ALTER TABLE [dbo].[ACT_PROCDEF_INFO] ADD FOREIGN KEY ([INFO_JSON_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_PROCDEF_INFO] ADD FOREIGN KEY ([PROC_DEF_ID_]) REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RE_MODEL]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD FOREIGN KEY ([DEPLOYMENT_ID_]) REFERENCES [dbo].[ACT_RE_DEPLOYMENT] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD FOREIGN KEY ([EDITOR_SOURCE_VALUE_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RE_MODEL] ADD FOREIGN KEY ([EDITOR_SOURCE_EXTRA_VALUE_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_EVENT_SUBSCR]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_EVENT_SUBSCR] ADD FOREIGN KEY ([EXECUTION_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_EXECUTION]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD FOREIGN KEY ([PARENT_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD FOREIGN KEY ([PROC_DEF_ID_]) REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_EXECUTION] ADD FOREIGN KEY ([SUPER_EXEC_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_IDENTITYLINK]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] ADD FOREIGN KEY ([PROC_DEF_ID_]) REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] ADD FOREIGN KEY ([PROC_INST_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_IDENTITYLINK] ADD FOREIGN KEY ([TASK_ID_]) REFERENCES [dbo].[ACT_RU_TASK] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_JOB]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_JOB] ADD FOREIGN KEY ([EXCEPTION_STACK_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_TASK]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_TASK] ADD FOREIGN KEY ([EXECUTION_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_TASK] ADD FOREIGN KEY ([PROC_DEF_ID_]) REFERENCES [dbo].[ACT_RE_PROCDEF] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_TASK] ADD FOREIGN KEY ([PROC_INST_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[ACT_RU_VARIABLE]
-- ----------------------------
ALTER TABLE [dbo].[ACT_RU_VARIABLE] ADD FOREIGN KEY ([BYTEARRAY_ID_]) REFERENCES [dbo].[ACT_GE_BYTEARRAY] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_VARIABLE] ADD FOREIGN KEY ([EXECUTION_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
ALTER TABLE [dbo].[ACT_RU_VARIABLE] ADD FOREIGN KEY ([PROC_INST_ID_]) REFERENCES [dbo].[ACT_RU_EXECUTION] ([ID_]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
