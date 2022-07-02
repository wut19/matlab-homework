function VS2_13()

    % ���峣��
    FL = 80;                % ֡��
    WL = 240;               % ����
    P = 10;                 % Ԥ��ϵ������
    s = readspeech('voice.pcm',100000);             % ��������s
    L = length(s);          % ������������
    FN = floor(L/FL)-2;     % ����֡��
    %�Լ�����ĳ���
    dOMG=150*2*pi*0.000125;
    % Ԥ����ؽ��˲���
    exc = zeros(L,1);       % �����źţ�Ԥ����
    zi_pre = zeros(P,1);    % Ԥ���˲�����״̬
    s_rec = zeros(L,1);     % �ؽ�����
    zi_rec = zeros(P,1);
    % �ϳ��˲���
    exc_syn = zeros(L,1);   % �ϳɵļ����źţ����崮��
    s_syn = zeros(L,1);     % �ϳ�����
    %�Լ������������ʼ����
    zi_syn = zeros(P,1);    %�ϳ��˲�����״̬
    r = 0;                  %֡����ʣ��
    % ����������˲���
    exc_syn_t = zeros(L,1);   % �ϳɵļ����źţ����崮��
    s_syn_t = zeros(L,1);     % �ϳ�����
    %�Լ������������ʼ����
    zi_syn_t = zeros(P,1);    %�˲�����״̬
    r_t = 0;                  %֡����ʣ��
    % ���ٲ�����˲����������ٶȼ���һ����
    exc_syn_v = zeros(2*L,1);   % �ϳɵļ����źţ����崮��
    s_syn_v = zeros(2*L,1);     % �ϳ�����
    %�Լ������������ʼ����
    zi_syn_v = zeros(P,1);    %�˲�����״̬
    r_v = 0;                  %֡����ʣ��
    
    hw = hamming(WL);       % ������
    
    % ���δ���ÿ֡����
    for n = 3:FN

        % ����Ԥ��ϵ��������Ҫ���գ�
        s_w = s(n*FL-WL+1:n*FL).*hw;    %��������Ȩ�������
        [A E] = lpc(s_w, P);            %������Ԥ�ⷨ����P��Ԥ��ϵ��
                                        % A��Ԥ��ϵ����E�ᱻ��������ϳɼ���������

        if n == 27
        % (3) �ڴ�λ��д���򣬹۲�Ԥ��ϵͳ���㼫��ͼ
           % zplane(A,[1]);
        end
        
        s_f = s((n-1)*FL+1:n*FL);       % ��֡�����������Ҫ����������

        % (4) �ڴ�λ��д������filter����s_f���㼤����ע�Ᵽ���˲���״̬
        [exc((n-1)*FL+1:n*FL) zf_pre] = filter(A,[1],s_f,zi_pre);
        zi_pre = zf_pre;
        % exc((n-1)*FL+1:n*FL) = ... �������õ��ļ���д������

        % (5) �ڴ�λ��д������filter������exc�ؽ�������ע�Ᵽ���˲���״̬
        [s_rec((n-1)*FL+1:n*FL) zf_rec] = filter([1],A,exc((n-1)*FL+1:n*FL),zi_rec);
        zi_rec = zf_rec;
         
        % s_rec((n-1)*FL+1:n*FL) = ... �������õ����ؽ�����д������

        % ע������ֻ���ڵõ�exc��Ż������ȷ
        s_Pitch = exc(n*FL-222:n*FL);
        PT = findpitch(s_Pitch);    % �����������PT����Ҫ�����գ�
        G = sqrt(E*PT);           % ����ϳɼ���������G����Ҫ�����գ�

        
        % (10) �ڴ�λ��д�������ɺϳɼ��������ü�����filter���������ϳ�����
        exc_syn((n-1)*FL+1:n*FL) = G * (mod(r + [1:FL].',PT)==0);
        r = mod(r + FL,PT);
        
        [s_syn((n-1)*FL+1:n*FL) zf_syn] = filter([1],A,exc_syn((n-1)*FL+1:n*FL),zi_syn);
        zi_syn = zf_syn;
        % exc_syn((n-1)*FL+1:n*FL) = ... �������õ��ĺϳɼ���д������
        % s_syn((n-1)*FL+1:n*FL) = ...   �������õ��ĺϳ�����д������

        % (11) ���ı�������ں�Ԥ��ϵ�������ϳɼ����ĳ�������һ��������Ϊfilter
        % ������õ��µĺϳ���������һ���ǲ����ٶȱ����ˣ�������û�б䡣
        exc_syn_v((n-1)*FL*2+1:n*FL*2) = G * (mod(r_v + [1:2*FL].',PT)==0);
        r_v = mod(r_v + 2*FL,PT);
        
        [s_syn_v((n-1)*2*FL+1:n*2*FL) zf_syn_v] = filter([1],A,exc_syn_v((n-1)*2*FL+1:n*2*FL),zi_syn_v);
        zi_syn_v = zf_syn_v;        
        
        % exc_syn_v((n-1)*FL_v+1:n*FL_v) = ... �������õ��ļӳ��ϳɼ���д������
        % s_syn_v((n-1)*FL_v+1:n*FL_v) = ...   �������õ��ļӳ��ϳ�����д������
        
        % (13) ���������ڼ�Сһ�룬�������Ƶ������150Hz�����ºϳ�������������ɶ���ܡ�
        PT_t = round(PT/2);
        %���ɼ����ź�
        exc_syn_t((n-1)*FL+1:n*FL) = G * (mod(r_t + [1:FL].',PT_t)==0);
        r_t = mod(r_t + FL,PT_t);
        %����ϵͳ����
        [z_t,p_t,k_t] = tf2zp(1,A);
        p_t = p_t.*exp((1j*dOMG)*sign(angle(p_t)));
        [B_t,A_t] = zp2tf(z_t,p_t,k_t);
        %�õ�����
        [s_syn_t((n-1)*FL+1:n*FL),zf_syn_t] = filter(B_t,A_t,exc_syn_t((n-1)*FL+1:n*FL),zi_syn_t);
        zi_syn_t = zf_syn_t;        
        
        % exc_syn_t((n-1)*FL+1:n*FL) = ... �������õ��ı���ϳɼ���д������
        % s_syn_t((n-1)*FL+1:n*FL) = ...   �������õ��ı���ϳ�����д������
        
    end

    % (6) �ڴ�λ��д������һ�� s ��exc �� s_rec �к����𣬽�����������
    % ��������������ĿҲ������������д���������ر�ע��
    
    %soundanddraw2_6(s,exc,s_rec,FN,FL);
    %soundanddraw2_10(s_syn,s);
    %soundanddraw2_11(s_syn_v,s);
    soundanddraw2_13(s_syn_t,s);

    % ���������ļ�
    writespeech('exc.pcm',exc);
    writespeech('rec.pcm',s_rec);
    writespeech('exc_syn.pcm',exc_syn);
    writespeech('syn.pcm',s_syn);
    writespeech('exc_syn_t.pcm',exc_syn_t);
    writespeech('syn_t.pcm',s_syn_t);
    writespeech('exc_syn_v.pcm',exc_syn_v);
    writespeech('syn_v.pcm',s_syn_v);
return

%2.13
function soundanddraw2_13(s_syn_t,s)
    sound(s_syn_t);
    pause(3);
    sound(s);
    figure;
    subplot(2,1,1);
    plot(s_syn_t);
    title('s\_syn\_t');
    subplot(2,1,2);
    plot(s);
    title('s');    
return

%2.11
function soundanddraw2_11(s_syn_v,s)
    sound(s_syn_v);
    pause(5);
    sound(s);
    figure;
    subplot(2,1,1);
    plot(s_syn_v);
    title('s\_syn\_v');
    subplot(2,1,2);
    plot(s);
    title('s');    
return

%2.10
function soundanddraw2_10(s_syn,s)
    sound(s_syn);
    pause(3);
    sound(s);
    figure;
    subplot(2,1,1);
    plot(s_syn);
    title('s\_syn');
    subplot(2,1,2);
    plot(s);
    title('s');
return

%2.6
function soundanddraw2_6(s,exc,s_rec,FN,FL)
    sound(s);
    pause(3);
    sound(s_rec);
    pause(3);
    sound(exc);
    
    % ȫ��
    figure;
    subplot(4,1,1);
    plot(exc);
    xlabel('n');
    ylabel('Amplitude');
    title('e');
    
    subplot(4,1,2);
    plot(s);
    xlabel('n');
    ylabel('Amplitude');
    title('s');
    
    subplot(4,1,3);
    plot(s_rec);
    xlabel('n');
    ylabel('Amplitude');
    title('s\_rec');
    
    subplot(4,1,4);
    plot(s - s_rec);
    xlabel('n');
    ylabel('Amplitude');
    title('s\_rec-s');
    
    figure;
    subplot(4,1,1);
    plot(exc(floor(FN/3)*FL+1:[floor(FN/3)+1]*FL));
    xlabel('n');
    ylabel('Amplitude');
    title('e');
    
    subplot(4,1,2);
    plot(s(floor(FN/3)*FL+1:[floor(FN/3)+1]*FL));
    xlabel('n');
    ylabel('Amplitude');
    title('s');
    
    subplot(4,1,3);
    plot(s_rec(floor(FN/3)*FL+1:[floor(FN/3)+1]*FL));
    xlabel('n');
    ylabel('Amplitude');
    title('s\_rec');
    
    subplot(4,1,4);
    plot(s(floor(FN/3)*FL+1:[floor(FN/3)+1]*FL) - s_rec(floor(FN/3)*FL+1:[floor(FN/3)+1]*FL));
    xlabel('n');
    ylabel('Amplitude');
    title('s\_rec-s');
return

% ��PCM�ļ��ж�������
function s = readspeech(filename, L)
    fid = fopen(filename, 'r');
    s = fread(fid, L, 'int16');
    fclose(fid);
return

% д������PCM�ļ���
function writespeech(filename,s)
    fid = fopen(filename,'w');
    fwrite(fid, s, 'int16');
    fclose(fid);
return

% ����һ�������Ļ������ڣ���Ҫ������
function PT = findpitch(s)
[B, A] = butter(5, 700/4000);
s = filter(B,A,s);
R = zeros(143,1);
for k=1:143
    R(k) = s(144:223)'*s(144-k:223-k);
end
[R1,T1] = max(R(80:143));
T1 = T1 + 79;
R1 = R1/(norm(s(144-T1:223-T1))+1);
[R2,T2] = max(R(40:79));
T2 = T2 + 39;
R2 = R2/(norm(s(144-T2:223-T2))+1);
[R3,T3] = max(R(20:39));
T3 = T3 + 19;
R3 = R3/(norm(s(144-T3:223-T3))+1);
Top = T1;
Rop = R1;
if R2 >= 0.85*Rop
    Rop = R2;
    Top = T2;
end
if R3 > 0.85*Rop
    Rop = R3;
    Top = T3;
end
PT = Top;
return