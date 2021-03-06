clear
clc
close all
%*************
i=45;
a=imread([num2str(i) '.jpg']);
%a=imresize(a,.5);
b=rgb2gray(a);
imhist(b)
c=im2double(b);
imhist(c)
figure,imshow(c)
pm=mean2(c);
pv=((std2(c))^2);
T=pm+pv;
%taarif Astane*******
[m,n]=size(c);
for j=1:n
    for i=1:m
        if c(i,j)>T;
            c(i,j)=1;
        else
            c(i,j)=0;
        end
    end
end
figure,imshow(c)
e=edge(c,'sobel');
figure,imshow(e)
d=imdilate(e,strel('line',3, 0));
figure,imshow(d)
h=imfill(d,'holes');
figure,imshow(h)
h=bwlabel(h);
stat=regionprops(h,'Area','BoundingBox','Orientation');
index = (find([stat.Area] == max([stat.Area])));
x1 = (stat(index).BoundingBox(1));
x2 = (stat(index).BoundingBox(3));
y1 = (stat(index).BoundingBox(2));
y2 = (stat(index).BoundingBox(4));
g=imcrop(b,[x1,y1,x2,y2]);
g=im2double(g);
gw=im2bw(g);
figure,imshow(g)
if abs(stat(index).Orientation) >0;
gr=imrotate(gw,-stat(index).Orientation);
angle = stat(index).Orientation;
else
gr=gw;
end;
figure,imshow(gr)
gr=~gr;
figure,imshow(gr)
stat1 = regionprops(bwlabel(gr),'Area','Image');
index1 = (find([stat1.Area] == max([stat1.Area])));
gs=stat1(index1).Image;
gr= imsubtract(gr,gs);
figure,imshow(gr)
gs=bwareaopen(gr,50);
figure,imshow(gs)
bw=bwlabel(gs);
stat3=regionprops(bw,'Image');
v1=imresize((stat3(1,1).Image),[25 15]);
v2=imresize((stat3(2,1).Image),[25 15]);
v3=imresize((stat3(3,1).Image),[25 15]);
v4=imresize((stat3(4,1).Image),[25 15]);
v5=imresize((stat3(5,1).Image),[25 15]);
v6=imresize((stat3(6,1).Image),[25 15]);
v7=imresize((stat3(7,1).Image),[25 15]);
imwrite(v1,'C:\Users\Ali\Desktop\test_data\1.jpg');
imwrite(v2,'C:\Users\Ali\Desktop\test_data\2.jpg');
imwrite(v3,'C:\Users\Ali\Desktop\test_data\3.jpg');
imwrite(v4,'C:\Users\Ali\Desktop\test_data\4.jpg');
imwrite(v5,'C:\Users\Ali\Desktop\test_data\5.jpg');
imwrite(v6,'C:\Users\Ali\Desktop\test_data\6.jpg');
imwrite(v7,'C:\Users\Ali\Desktop\test_data\7.jpg');
subplot(2,4,1),imshow(v1)
subplot(2,4,2),imshow(v2) 
subplot(2,4,3),imshow(v3)
subplot(2,4,4),imshow(v4)
subplot(2,4,5),imshow(v5)
subplot(2,4,6),imshow(v6)
subplot(2,4,7),imshow(v7)
%%Neural Network
clc;
clear all;
%close all;
%%
a=zeros(140,25*15);
for i=1:140
b=imread(['C:\Users\Ali\Desktop\Data_base\' num2str(i) '.jpg']);
b=im2bw(b);
n=3;
[h w] = size(b);
lr = zeros(h, n);
b = [lr b lr];
tb = zeros(n, w + 2*n);
b = [tb; b; tb];
b=imresize(b,[25 15]);
b=reshape(b',[1 25*15]);
a(i,:)=b;
end
%%
for r=1:140
    for c=1:375
        if a(r,c)==0;
            a(r,c)=-1;
        end
    end
end
%%
t=[1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 
    -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1];   
w=zeros(375,14);
w2=zeros(375,14);
yin=zeros(1,14);
y=zeros(1,14);
flag=0;
epoch=0;
%%
%**********Train*******%

while flag==0
    epoch=epoch+1;
    for i=1:140
      yin=zeros(1,14);
      y=zeros(1,14);
        for j=1:14
            for kk=1:375
                yin(j)=yin(j)+a(i,kk)*w(kk,j);
            end
            if yin(j)>0
                y(j)=1;
            else
                y(j)=-1;   
            end
            if y(j)~=t(i,j)
                for l=1:375
                    w(l,j)=w(l,j)+a(i,l)*t(i,j); 
                end
            end
        end
        
    end
    if w2==w
        flag=1;
    else
        w2=w;
    end
end

%%
%**************Test************%
test=zeros(14,25*15);
for i=1:7
a11 = im2double(im2bw(imread(['C:\Users\Ali\Desktop\test_data\' num2str(i) '.jpg'])));
n2=2;
[h w3] = size(a11);
lr = zeros(h, n2);
a11 = [lr a11 lr];
tb = zeros(n2, w3 + 2*n2);
a11 = [tb; a11; tb];
a11=imresize(a11,[25 15]);
a11=reshape(a11',[1 25*15]);
    for c=1:375
        if a11(1,c)==0;
            a11(1,c)=-1;
        end
    end
test(i,:)=a11;
end

for i=1:14
yin=zeros(1,14);
y=zeros(1,14);
for j=1:14
    for k=1:375
        yin(j)=yin(j)+test(i,k)*w(k,j);
    end
    
    if yin(j)>0
        y(j)=1;
    else 
        y(j)=-1;
    end
end
y;
if y==[1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
    'y'
elseif y==[-1 1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1];
    'F'
elseif y==[-1 1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
    'N'
elseif y==[-1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
    '3'
elseif y==[-1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
    'A'
elseif y==[-1 -1 -1 -1 -1 1 -1 -1 -1 1 -1 -1 -1 -1];
    '4'
elseif y==[-1 1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1];
    'U'
elseif y==[-1 -1 -1 1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1];
    'S'
elseif y==[-1 1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
    '5'
elseif y==[-1 1 1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1];
    'M'
elseif y==[-1 1 -1 1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1];
    'B'
elseif y==[-1 1 -1 1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1];
    '0'
elseif y==[-1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
    'I'
elseif y==[-1 -1 -1 1 1 -1 -1 1 -1 -1 -1 -1 -1 1];
    '1'
end

end
