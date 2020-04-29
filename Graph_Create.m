
% -------------------------------------------------------------------------
%�������������
%Graph:��¼����ÿ��Ľڵ���
%Arc:��¼����ߵ�����
%R:��¼���ڵ��Rֵ
%P:��¼���ڵ��Pֵ
%CoopNum:��������������ÿ���˿���Ͷ���ĺ�����
% -------------------------------------------------------------------------
clc;clear;
Chain_layer_Num=8;    %�ڵ����
Arc_layer_Num=Chain_layer_Num-1;   %�߲���


%ͼ�ڵ�
node_sum=0;    %�ڵ�����
node_num=zeros(1,Chain_layer_Num);   %����ڵ����
Max_node_num_of_one_layer=10*ones(1,Chain_layer_Num); %ÿһ�����ڵ����
Min_node_num_of_one_layer=4*ones(1,Chain_layer_Num); %ÿһ����С�ڵ����

Graph = cell(1,Chain_layer_Num);
for i=1:Chain_layer_Num
    node_num(i)=randi([Min_node_num_of_one_layer(i),Max_node_num_of_one_layer(i)],1);    %��i��ڵ������10�������ȡ�������
    Graph{i}=((node_sum+1):(node_sum+node_num(i)));
    node_sum=node_sum+node_num(i);
end

%������
Arc = cell(1,Arc_layer_Num);
for i=1:Arc_layer_Num
    Max_arc_num_of_one_layer=length(Graph{i})*length(Graph{i+1});   %��i��������������Ϊȫ����ʱ��
    Min_arc_num_of_one_layer=ceil(Max_arc_num_of_one_layer/3);     %��i����С������ȡΪȫ���ӵ�һ�룬����ȡ����
    Arc_num(i)=randi([Min_arc_num_of_one_layer,Max_arc_num_of_one_layer],1);                  %��i�����ʵ����
    Connect_matrix=zeros(Arc_num(i),2);  %��i������Ӿ���(����*2����)
    for j=1:Arc_num(i)
        Connect_matrix(j,1)=randi([Graph{i}(1),Graph{i}(1)+length(Graph{i})-1],1); %Node_choose_i_layer
        Connect_matrix(j,2)=randi([Graph{i+1}(1),Graph{i+1}(1)+length(Graph{i+1})-1],1);  %Node_choose_i+1_layer
    end
    Arc{i}=Connect_matrix;
end
        
%Rֵ
R = cell(1,3);
R{1} = rand(3,1);%��һ���Rֵ
R{2} = rand(2,1);
R{3} = rand(2,1);

%�ı���ʾ���P
P = cell(1,3); 
P{1} = rand(3,1);%��һ���Pֵ
P{2} = rand(2,1);
P{3} = rand(2,1);


