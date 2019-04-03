function UserInput=keyboard_GetData()

% USE: On Screen Keyboard
% How to: Intuitive 
% What happens: GUI based Takes Input
% Who did: Swapan Masanta - 28-Mar-2019 11:27:36

% Inspired By
% https://in.mathworks.com/matlabcentral/answers/8195-on-screen-keyboard?s_tid=answers_rc1-2_p2_MLT

try delete Final.mat
catch
end
keyboard_gui
uiwait(gcf)
try
    load ('C:\Users\User\Downloads\Matlab_testing\Final.mat');
    UserInput=Final;
catch
    UserInput='';
end
end

function keyboard_gui()

colBack=[41,40,38]/255; %53,53,55
colKey=[41,40,38]/255;%[139,192,100]/255;
colFront=[249,211,66]/255;
colFront2=[41,40,38]/255;
colHigh=[249,211,66]/255;%[1 1 0]



set(0,'units','pix')
SCR = get(0,'screensize');
S.fh = figure('menubar','none',...
    'numbertitle','off',...
    'name','OnScreen Keyboard',...
    'units','pix',...
    'resize','on',...
    'position',[0 0 SCR(3) SCR(4)-25],...
    'color',colBack);
S.POS = cell(28,1);  % Pre-allocate so we get a column vector.
for ii = 1:26  % Create the letter buttons.
    ax = subplot(5,6,ii);  % Use SUBPLOT to get alignment.
    set(ax,'units','normalized','visible','off')
    S.POS{ii} = round(get(ax,'pos')*1000)/1000 - [0 .075 0 0];
    delete(ax)
    S.pb(ii) = uicontrol('style','pushbutton',...
        'units','norm',...
        'position',S.POS{ii},...
        'string',char(96+ii),...
        'fontsize',45,...
        'fontweight','bold',...
        'ForegroundColor',colFront,...
        'enable','on','Callback',@(~,~)AddLetter(char(96+ii)));
end
S.POS{31}=S.POS{24};
S.POS{31}(2)=S.POS{24}(2)-(S.POS{6}(2)-S.POS{12}(2));
S.pb(27) =  uicontrol('style','pushbutton',...
    'units','norm',...
    'position',S.POS{31},...
    'string','BackSpace',...
    'fontsize',15,...
    'fontweight','bold',...
    'ForegroundColor',colFront,...
    'enable','on');

% SPACE button.
pwidth = S.POS{2}(3)+S.POS{2}(1)-S.POS{1}(1)-(S.POS{4}(1)-S.POS{3}(1));
S.POS{27} = [S.POS{3}(1) S.POS{26}(2) pwidth S.POS{1}(4)]; % BACKSPACE button.

S.pb(31) =  uicontrol('style','pushbutton',...
    'units','norm',...
    'position',S.POS{27}+[0 0 .2705 0],...
    'string','Space',...
    'fontsize',25,...
    'fontweight','bold',...
    'ForegroundColor',colFront,...
    'enable','on','Callback',@(~,~)AddLetter(char(127)));




S.pb(28) = uicontrol('style','push',...                 % The CLEAR button.
    'units','norm',...
    'position',[0.84625 0.875 .10375 0.11],...
    'string','Submit',...
    'fontsize',20,...
    'ForegroundColor',colFront,...
    'fontweight','bold',...
    'enable','on');

%%
S.POS1{1,1}=S.POS{1}(1)-3*(S.POS{2}(1)-S.POS{1}(1))/5;
S.POS1{2,1}=S.POS{1}(1)-3*(S.POS{2}(1)-S.POS{1}(1))/5+3*S.POS{1}(3)/10;
S.POS1{3,1}=S.POS{1}(1)-3*(S.POS{2}(1)-S.POS{1}(1))/5;%
S.POS1{4,1}=S.POS{1}(1)-3*(S.POS{2}(1)-S.POS{1}(1))/5+3*S.POS{1}(3)/10;

S.POS1{1,2}=S.POS{1}(2)+S.POS{1}(4)/2;
S.POS1{2,2}=S.POS{1}(2)+S.POS{1}(4)/2;
S.POS1{3,2}=S.POS{1}(2);%
S.POS1{4,2}=S.POS{1}(2);

for i = 1:4  % Create the letter buttons.
    S.pb1(i) = uicontrol('style','pushbutton',...
        'units','norm',...
        'position',[S.POS1{i,1}  S.POS1{i,2} 3*S.POS{1}(3)/10 S.POS{1}(4)/2],...
        'string',char(47+i),...
        'fontsize',20,...
        'fontweight','bold',...
        'ForegroundColor',colFront,...
        'enable','on','Callback',@(~,~)AddLetter(char(47+i)));
end

%%
S.POS2{1,1}=S.POS{7}(1)-3*(S.POS{8}(1)-S.POS{7}(1))/5;
S.POS2{2,1}=S.POS{7}(1)-3*(S.POS{8}(1)-S.POS{7}(1))/5+3*S.POS{7}(3)/10;
S.POS2{3,1}=S.POS{7}(1)-3*(S.POS{8}(1)-S.POS{7}(1))/5;%
S.POS2{4,1}=S.POS{7}(1)-3*(S.POS{8}(1)-S.POS{7}(1))/5+3*S.POS{7}(3)/10;

S.POS2{1,2}=S.POS{7}(2)+S.POS{1}(4)/2;
S.POS2{2,2}=S.POS{7}(2)+S.POS{1}(4)/2;
S.POS2{3,2}=S.POS{7}(2);
S.POS2{4,2}=S.POS{7}(2);

for i = 1:4  % Create the letter buttons.
    S.pb2(i) = uicontrol('style','pushbutton',...
        'units','norm',...
        'position',[S.POS2{i,1}  S.POS2{i,2} 3*S.POS{1}(3)/10 S.POS{1}(4)/2],...
        'string',char(52+i),...
        'fontsize',20,...
        'fontweight','bold',...
        'ForegroundColor',colFront,...
        'enable','on','Callback',@(~,~)AddLetter(char(52+i)));
end

%%
S.POS3{1,1}=S.POS{13}(1)-3*(S.POS{14}(1)-S.POS{13}(1))/5;
S.POS3{2,1}=S.POS{13}(1)-3*(S.POS{14}(1)-S.POS{13}(1))/5+3*S.POS{7}(3)/10;
S.POS3{3,1}=S.POS{13}(1)-3*(S.POS{14}(1)-S.POS{13}(1))/5;%
S.POS3{4,1}=S.POS{13}(1)-3*(S.POS{14}(1)-S.POS{13}(1))/5+3*S.POS{7}(3)/10;

S.POS3{1,2}=S.POS{13}(2)+S.POS{1}(4)/2;
S.POS3{2,2}=S.POS{13}(2)+S.POS{1}(4)/2;
S.POS3{3,2}=S.POS{13}(2);
S.POS3{4,2}=S.POS{13}(2);

for i = 1:2  % Create the letter buttons.
    S.pb3(i) = uicontrol('style','pushbutton',...
        'units','norm',...
        'position',[S.POS3{i,1}  S.POS3{i,2} 3*S.POS{1}(3)/10 S.POS{1}(4)/2],...
        'string',char(55+i),...
        'fontsize',20,...
        'fontweight','bold',...
        'ForegroundColor',colFront,...
        'enable','on','Callback',@(~,~)AddLetter(char(55+i)));
end

S.pb3(3) = uicontrol('style','pushbutton',...
    'units','norm',...
    'position',[S.POS3{3,1}  S.POS3{3,2} 3*S.POS{1}(3)/5 S.POS{1}(4)/2],...
    'string','lower',...
    'fontsize',20,...
    'fontweight','bold',...
    'ForegroundColor',colFront,...
    'enable','on','Callback',@LowerCase);




S.pb(29) = uicontrol('style','push',...                 % The '.' button.
    'units','norm',...
    'position',[S.POS{19}(1)-3*(S.POS{21}(1)-S.POS{20}(1))/5 S.POS{20}(2) 3*S.POS{1}(3)/5 S.POS{1}(4)],...
    'string','.',...
    'fontsize',50,...
    'fontweight','bold',...
    'ForegroundColor',colFront,...
    'enable','on','Callback',@(~,~)AddLetter('.'));


S.pb(30) = uicontrol('style','push',...                 % The '@' button.
    'units','norm',...
    'position',[S.POS{25}(1)-3*(S.POS{21}(1)-S.POS{20}(1))/5 S.POS{25}(2) 3*S.POS{1}(3)/5 S.POS{1}(4)],...
    'string','@',...
    'fontsize',15,...
    'fontweight','bold',...
    'ForegroundColor',colFront,...
    'enable','on','Callback',@(~,~)AddLetter('@'));

%%
S.ed = uicontrol('style','edit',...
    'units','norm',...
    'position',[0.04 0.875 0.7825 0.11],...
    'fontsize',30,...
    'fontweight','bold',...
    'ForegroundColor',[139,216,189]/255,...
    'backgroundcolor',[20,26,70]/255,...
    'horizontalalignment','center',...
    'enable','on');
set(S.pb,'backgroundcolor',colKey)
set(S.pb1,'backgroundcolor',colKey)
set(S.pb2,'backgroundcolor',colKey)
set(S.pb3,'backgroundcolor',colKey)
drawnow       % Flush event queue

set(S.pb(27),'callback',{@DeleteLetter})  % Set the callback for pushbutton.
set(S.pb(28),'callback',{@(~,~)SubmitLetters})  % Set the callback for pushbutton.

%%
    function [] = DeleteLetter(varargin)
        % Callback for the pushbutton.
        T = get(S.ed,'string');  % Get the current string.
        
        if isempty(T)
            set(S.pb(27),'backgroundcolor',colHigh,'string','Nothing to Delete!','fontsize',8,'ForegroundColor',colFront2)
            pause(0.2)
            set(S.pb(27),'backgroundcolor',colKey,'string','BackSpace','fontsize',15,'ForegroundColor',colFront)
        else
            
            set(S.ed,'str',T(1:end-1));  % Delete the last character in string.
        end
    end
%%
    function AddLetter(letter)
        %Called when letter pressed
        %Add letter to string
        if strcmp(get(S.pb3(3),'string'),'CAPS')
            set(S.ed,'string',strcat(get(S.ed,'string'),upper(letter)));
        else
            set(S.ed,'string',strcat(get(S.ed,'string'),letter));
        end
        
        drawnow;
        %NOTE: Obviously, you'll need to add features here such as
        %backspace etc.
    end
%%
    function Final=SubmitLetters(varargin)
        % Callback for the pushbutton.
        
        T = get(S.ed,'string');  % Get the current string.
        if isempty(T)
            Final='';
        else
            Final=T;
            
        end
        save Final Final
        disp (Final)
        close gcf
    end

%%

    function []= LowerCase(varargin)
        % Callback for the pushbutton.
        if strcmp(get(S.pb3(3),'string'),'CAPS')
            set(S.pb3(3),'string','lower','backgroundcolor',colKey,'ForegroundColor',colFront);
            %             set(S.ed,'string',upper(get(S.ed,'string')));
        else
            set(S.pb3(3),'string','CAPS','backgroundcolor',colHigh,'ForegroundColor',colFront2);
            %             set(S.ed,'string',lower(get(S.ed,'string')));
        end
        drawnow;
    end


end

