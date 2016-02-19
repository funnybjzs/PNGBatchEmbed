function BatchEmbed(imgdir,embedrate)
%写log
f = fopen('stego_png.txt', 'a', 'n', 'UTF-8');
f_log= fopen('log.txt', 'a', 'n', 'UTF-8');
%遍历所有文件夹
for d=1:length(imgdir)
    stego_dirs{d}=[imgdir{d} '_stego'];
    msg_dirs{d}=[imgdir{d} '_msg'];
    %创建隐写目录和隐秘消息目录
    mkdir(stego_dirs{d});
    mkdir(msg_dirs{d});
    %开始对COVER文件夹下的图片进行嵌入
    files=dir([imgdir{d} '\*.png']);  %文件
    fprintf('---------------------------\n');
    fprintf('[开始时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('进入目录:  %s\n',imgdir{d});
    fprintf('该目录下共有 %d 张jpg图像\n',numel(files));
    fprintf(f_log,'---------------------------\n');
    fprintf(f_log,'[开始时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf(f_log,'进入目录:  %s\n',imgdir{d});
    fprintf(f_log,'该目录下共有 %d 张jpg图像\n',numel(files));
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
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(1)); 
                fprintf(f_log,'process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(1)); 
            elseif(mod(id,10)==2)
                msglength=floor(im.Width*im.Height*embedrate(2)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(2)); 
                fprintf(f_log,'process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(2)); 
            elseif(mod(id,10)==3)
                msglength=floor(im.Width*im.Height*embedrate(3)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(3)); 
                fprintf(f_log,'process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(3)); 
            elseif(mod(id,10)==4)
                msglength=floor(im.Width*im.Height*embedrate(4)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(4)); 
                fprintf(f_log,'process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(4)); 
            elseif(mod(id,10)==5)
                msglength=floor(im.Width*im.Height*embedrate(5)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(5)); 
                fprintf(f_log,'process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(5)); 
            elseif(mod(id,10)==6)
                msglength=floor(im.Width*im.Height*embedrate(1)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(1)); 
                fprintf(f_log,'process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(1)); 
            elseif(mod(id,10)==7)
                msglength=floor(im.Width*im.Height*embedrate(2)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(2)); 
                fprintf(f_log,'process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(2)); 
            elseif(mod(id,10)==8)
                msglength=floor(im.Width*im.Height*embedrate(3)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(3)); 
                fprintf(f_log,'process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(3)); 
            elseif(mod(id,10)==9)
                msglength=floor(im.Width*im.Height*embedrate(4)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(4)); 
                fprintf(f_log,'process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(4)); 
            else
                msglength=floor(im.Width*im.Height*embedrate(5)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(5)); 
                fprintf(f_log,'process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(5)); 
            end
        end    
    catch
        fprintf('process %s [fail]\n',infiles.File1);
        WriteLog(f,[imgdir{d} '\' files(id).name],ex.getReport);
    end
    fprintf(f_log,'[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf(f_log,'---------------------------\r\n');
    fprintf('[结束时间: %s]\n',datestr(now,'yy-mm-dd HH:MM:SS'));
    fprintf('---------------------------\n');
end
fclose(f);
fclose(f_log);
end