RCS = ones(3,180,181,4);
phi_scan = '180';  % 如果phi_scan是'1'，代表不扫描，如果想要扫描phi方向，请将phi_scan设置为'180'

RCS1_1 = [xlsread('.\date_source\RCS_8GHz.xlsx', 'Sheet1',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_8GHz.xlsx', 'Sheet1', ['A1:CL', phi_scan])];
RCS1_2 = [xlsread('.\date_source\RCS_8GHz.xlsx', 'Sheet2',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_8GHz.xlsx', 'Sheet2', ['A1:CL', phi_scan])];
RCS1_3 = [xlsread('.\date_source\RCS_8GHz.xlsx', 'Sheet3',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_8GHz.xlsx', 'Sheet3', ['A1:CL', phi_scan])];
RCS1_4 = [xlsread('.\date_source\RCS_8GHz.xlsx', 'Sheet4',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_8GHz.xlsx', 'Sheet4', ['A1:CL', phi_scan])];

RCS2_1 = [xlsread('.\date_source\RCS_10GHz.xlsx', 'Sheet1',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_10GHz.xlsx', 'Sheet1', ['A1:CL', phi_scan])];
RCS2_2 = [xlsread('.\date_source\RCS_10GHz.xlsx', 'Sheet2',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_10GHz.xlsx', 'Sheet2', ['A1:CL', phi_scan])];
RCS2_3 = [xlsread('.\date_source\RCS_10GHz.xlsx', 'Sheet3',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_10GHz.xlsx', 'Sheet3', ['A1:CL', phi_scan])];
RCS2_4 = [xlsread('.\date_source\RCS_10GHz.xlsx', 'Sheet4',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_10GHz.xlsx', 'Sheet4', ['A1:CL', phi_scan])];

RCS3_1 = [xlsread('.\date_source\RCS_12GHz.xlsx', 'Sheet1',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_12GHz.xlsx', 'Sheet1', ['A1:CL', phi_scan])];
RCS3_2 = [xlsread('.\date_source\RCS_12GHz.xlsx', 'Sheet2',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_12GHz.xlsx', 'Sheet2', ['A1:CL', phi_scan])];
RCS3_3 = [xlsread('.\date_source\RCS_12GHz.xlsx', 'Sheet3',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_12GHz.xlsx', 'Sheet3', ['A1:CL', phi_scan])];
RCS3_4 = [xlsread('.\date_source\RCS_12GHz.xlsx', 'Sheet4',['JK1:MW', phi_scan]), xlsread('.\date_source\RCS_12GHz.xlsx', 'Sheet4', ['A1:CL', phi_scan])];

RCS(1,:,:,1)=RCS1_1;
RCS(1,:,:,2)=RCS1_2;
RCS(1,:,:,3)=RCS1_3;
RCS(1,:,:,4)=RCS1_4;

RCS(2,:,:,1)=RCS2_1;
RCS(2,:,:,2)=RCS2_2;
RCS(2,:,:,3)=RCS2_3;
RCS(2,:,:,4)=RCS2_4;

RCS(3,:,:,1)=RCS3_1;
RCS(3,:,:,2)=RCS3_2;
RCS(3,:,:,3)=RCS3_3;
RCS(3,:,:,4)=RCS3_4;


