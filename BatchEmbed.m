function BatchEmbed(imgdir,embedrate)
%写log
f = fopen('stego_png.txt', 'a', 'n', 'UTF-8');
%遍历所有文件夹
for d=1:length(imgdir)
    stego_dirs{d}=[imgdir{d} '_stego'];
    msg_dirs{d}=[imgdir{d} '_msg'];
    %创建隐写目录和隐秘消息目录
    mkdir(stego_dirs{d});
    mkdir(msg_dirs{d});
    %开始对COVER文件夹下的图片进行嵌入
    try
        files=dir([imgdir{d} '\*.png']);  %文件
        for (id=1:numel(files))
            im=imfinfo([imgdir{d} '\' files(id).name]);
            if(mod(id,10)==1)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(1)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(1)); 
            elseif(mod(id,10)==2)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(2)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(2)); 
            elseif(mod(id,10)==3)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(3)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(3)); 
            elseif(mod(id,10)==4)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(4)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(4)); 
            elseif(mod(id,10)==5)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(5)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBM(infiles,outfiles);
                fprintf('process %s [OK]--[LSBM、%f]\n',infiles.File1,embedrate(5)); 
            elseif(mod(id,10)==6)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(1)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(1)); 
            elseif(mod(id,10)==7)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(2)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(2)); 
            elseif(mod(id,10)==8)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(3)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(3)); 
            elseif(mod(id,10)==9)
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(4)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(4)); 
            else
                infiles.File1=[imgdir{d} '\' files(id).name];
                infiles.MsgFile=[msg_dirs{d} '\' files(id).name '.bin'];
                msglength=floor(im.Width*im.Height*embedrate(5)/8);
                GenMsg(id, msglength, infiles.MsgFile);
                outfiles.File1=[stego_dirs{d} '\' files(id).name];
                infiles.IncDecKey=10000+id;
                infiles.PosKey=id;
                LSBR(infiles,outfiles);
                fprintf('process %s [OK]--[LSBR、%f]\n',infiles.File1,embedrate(5)); 
            end
        end    
    catch
        fprintf('process %s [fail]\n',infiles.File1);
        WriteLog(f,[imgdir{d} '\' files(id).name],ex.getReport);
    end
end
end