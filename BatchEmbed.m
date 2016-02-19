function BatchEmbed(imgdir,embedrate)
%дlog
f = fopen('stego_png.txt', 'a', 'n', 'UTF-8');
f_log= fopen('log.txt', 'a', 'n', 'UTF-8');
%���������ļ���
for d=1:length(imgdir)
    stego_dirs{d}=[imgdir{d} '_stego'];
    msg_dirs{d}=[imgdir{d} '_msg'];
    %������дĿ¼��������ϢĿ¼
    mkdir(stego_dirs{d});
    mkdir(msg_dirs{d});
    %��ʼ��COVER�ļ����µ�ͼƬ����Ƕ��
    files=dir([imgdir{d} '\*.png']);  %�ļ�
    fprintf('---------------------------\n');
    fprintf('[��ʼʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('����Ŀ¼:  %s\n',imgdir{d});
    fprintf('��Ŀ¼�¹��� %d ��jpgͼ��\n',numel(files));
    fprintf(f_log,'---------------------------\n');
    fprintf(f_log,'[��ʼʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf(f_log,'����Ŀ¼:  %s\n',imgdir{d});
    fprintf(f_log,'��Ŀ¼�¹��� %d ��jpgͼ��\n',numel(files));
    try
        for (id=1:numel(files))
            im=imfinfo([imgdir{d} '\' files(id).name]);
            infiles.File1=[imgdir{d} '\' files(id).name];
            infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
            outfiles.File1=[stego_dirs{d} '\' files(id).name];
            infiles.IncDecKey=10000+id;
            infiles.PosKey=id;
            if(mod(id,10)==1)
                msglength=floor(im.Width*im.Height*embedrate(1)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(1)); 
                fprintf(f_log,'process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(1)); 
            elseif(mod(id,10)==2)
                msglength=floor(im.Width*im.Height*embedrate(2)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(2)); 
                fprintf(f_log,'process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(2)); 
            elseif(mod(id,10)==3)
                msglength=floor(im.Width*im.Height*embedrate(3)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(3)); 
                fprintf(f_log,'process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(3)); 
            elseif(mod(id,10)==4)
                msglength=floor(im.Width*im.Height*embedrate(4)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(4)); 
                fprintf(f_log,'process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(4)); 
            elseif(mod(id,10)==5)
                msglength=floor(im.Width*im.Height*embedrate(5)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(5)); 
                fprintf(f_log,'process %s [OK]--[LSBM��%f]\n',infiles.File1,embedrate(5)); 
            elseif(mod(id,10)==6)
                msglength=floor(im.Width*im.Height*embedrate(1)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(1)); 
                fprintf(f_log,'process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(1)); 
            elseif(mod(id,10)==7)
                msglength=floor(im.Width*im.Height*embedrate(2)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(2)); 
                fprintf(f_log,'process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(2)); 
            elseif(mod(id,10)==8)
                msglength=floor(im.Width*im.Height*embedrate(3)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(3)); 
                fprintf(f_log,'process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(3)); 
            elseif(mod(id,10)==9)
                msglength=floor(im.Width*im.Height*embedrate(4)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(4)); 
                fprintf(f_log,'process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(4)); 
            else
                msglength=floor(im.Width*im.Height*embedrate(5)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(5)); 
                fprintf(f_log,'process %s [OK]--[LSBR��%f]\n',infiles.File1,embedrate(5)); 
            end
        end    
    catch
        fprintf('process %s [fail]\n',infiles.File1);
        WriteLog(f,[imgdir{d} '\' files(id).name],ex.getReport);
    end
    fprintf(f_log,'[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf(f_log,'---------------------------\r\n');
    fprintf('[����ʱ��: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\n');
end
fclose(f);
fclose(f_log);
end