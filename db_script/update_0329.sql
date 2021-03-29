
DELETE FROM T00_INDIC_LIST 
WHERE 1=1 
AND TB = 'ZCFZ'
AND TYPE = 'O'
AND NBR  IN ('309','310','311');

COMMIT;

INSERT INTO `t00_indic_list` VALUES ('ZCFZ', 'O', '309', ' �����ɶ�Ȩ��', '0', '1', 'D', '', '', '1', '56');
INSERT INTO `t00_indic_list` VALUES ('ZCFZ', 'O', '310', '������Ȩ�棨��ɶ�Ȩ�棩�ϼ�', '2', '1', 'C', '', '', '1', '57');
INSERT INTO `t00_indic_list` VALUES ('ZCFZ', 'O', '311', '��ծ��������Ȩ�棨��ɶ�Ȩ�棩�ܼ�', '3', '1', 'C', '', '', '1', '58');
COMMIT;

INSERT INTO T00_INDIC_MAP VALUES('ZCFZ',  'O', '310', 'ZCFZ_O_308', '1', '1', '');
INSERT INTO T00_INDIC_MAP VALUES('ZCFZ',  'O', '311', 'ZCFZ_B_217', '1', '1', '');
INSERT INTO T00_INDIC_MAP VALUES('ZCFZ',  'O', '311', 'ZCFZ_O_310', '1', '1', '');
COMMIT;