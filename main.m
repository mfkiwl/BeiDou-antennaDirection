
%---------------------------------------------
%       Program initialization
%---------------------------------------------
clc;
clearvars -except RCS;

%---------------------------------------------
%       Set basic parameters
%---------------------------------------------
num_of_big = 4;  % 4*4 antenna array
num_of_small = 2; % 2*2 Subarray
center_angle = 80;  % The central angle is 80 degrees (angle system)
p = 0.015;  % period
lambda = 0.0375;  % wavelength
phi_scan = '1';  % 如果phi_scan是'1'，代表不扫描，如果想要扫描phi方向，请将phi_scan设置为'180'
plotOrNot = true ;  % 是否画图
xlsOrNot = false;  % 是否输出xls文件
xlsName = 'result';

%---------------------------------------------
%       Read files
%---------------------------------------------

% RCS1 = [xlsread('.\date_source\Rcs.xlsx', 'Sheet1', ['JK1:MW', phi_scan]), xlsread('.\date_source\Rcs.xlsx', 'Sheet1', ['A1:CL', phi_scan])];
% RCS2 = [xlsread('.\date_source\Rcs.xlsx', 'Sheet2', ['JK1:MW', phi_scan]), xlsread('.\date_source\Rcs.xlsx', 'Sheet2', ['A1:CL', phi_scan])];
% RCS3 = [xlsread('.\date_source\Rcs.xlsx', 'Sheet3', ['JK1:MW', phi_scan]), xlsread('.\date_source\Rcs.xlsx', 'Sheet3', ['A1:CL', phi_scan])];
% RCS4 = [xlsread('.\date_source\Rcs.xlsx', 'Sheet4', ['JK1:MW', phi_scan]), xlsread('.\date_source\Rcs.xlsx', 'Sheet4', ['A1:CL', phi_scan])];
% 
% RCS(:,:,1)=RCS1;
% RCS(:,:,2)=RCS2;
% RCS(:,:,3)=RCS3;
% RCS(:,:,4)=RCS4;

PHI = [14.9604,-75.5002,-154.2015,-242.6656]./180*pi;
subscript_mat = [1 2 3 2;3 3 1 3;3 3 4 2;2 1 4 2];
subscript_mat = kron(subscript_mat, ones(num_of_small));

%---------------------------------------------
%       Data preprocessing
%---------------------------------------------

side_length = num_of_big * num_of_small;  % 阵列弧长
center_angle = center_angle / 180 * pi;  % 圆心角
R =  side_length * p / center_angle;  % 已知n和p还有圆心角，依据弧长公式求出R
k = 2 * pi / lambda;   % 波向量

h0 = R * cos( center_angle / 2 );  % 曲面弦高
hn = R * cos((R * center_angle / 2 - p*((1:side_length) - 1/2)) / R) - h0; 
p0 = R * sin( center_angle / 2 );  % 半弦长
pn =- R * sin((R * center_angle/2 - p*((1:side_length) - 1/2)) / R) + p0;
m = [1 2 3 4 5 6 7 8]';

phi_scan = str2double(phi_scan);  % 将原来字符型的phi_scan转换为double型

f = ones(phi_scan,181);

%---------------------------------------------
%       计算方向图
%---------------------------------------------
PHI_h = kron(2 * k * hn - pi, ones(8,1));
 for phi = 1:phi_scan
    for theta = linspace(-90,90,181)
        Arc_theta = theta/180*pi;
        Arc_phi = (phi-1)/180*pi;
        PHI_p = k * sin(Arc_theta) * (cos(Arc_phi) * pn + sin(Arc_phi) * p*(m-1/2));
        f(phi, theta+91) = sum(sum( reshape( RCS(phi, theta+91, subscript_mat), [8,8] ) .* exp(-1i * (PHI_h + PHI_p + PHI(subscript_mat) ) ) ) ,2 ); 
    end
 end
f= 20*log10(abs(f));

if plotOrNot == true
    if phi_scan == 1
        plot( -90:90, f(1,:), 'LineWidth', 3 );
        title = '1D方向图';
    else
        theta=linspace(0,pi);
        phi=linspace(0,2*pi);
        [tt,pp]=meshgrid(theta,phi);
        [x,y,z] = sph2cart(pp,pi/2-tt,f);
        surf(x,y,z)
        shading flat
    end
    yy = ylabel('RCS(dB)');
    xx = xlabel('Theta(deg)');
    set(xx,'FontSize',20);
    set(yy,'FontSize',20);
end

if xlsOrNot == true
    ff = f';
    file_name = ['\data_result\',xlsName,'.xlsx'];
    xlswrite(file_name,ff);
end

% time_now = datestr(now,30);
% ff = f';
% file_name = ['\data_result\result_XOZ_',time_now,'.xlsx'];
% xlswrite(file_name,ff);