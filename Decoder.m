function decoded_data=Decoder(data,code_rate)
trel=poly2trellis([7],[133,171]);
if code_rate==1/2
    DEC = comm.ViterbiDecoder(trel,...
                'TerminationMethod','Continuous',...
                'InputFormat','Hard');
elseif code_rate==2/3
    DEC = comm.ViterbiDecoder(trel,...
                'InputFormat','Hard', ...
                'TerminationMethod','Continuous',...
                'PuncturePatternSource','Property',...
                'PuncturePattern',[1; 1; 1; 0;]);
else
    disp("code rate is not supported")
end
global ERR
ERR= comm.ErrorRate('ReceiveDelay',DEC.TracebackDepth,'ResetInputPort',true);
[row,col]=size(data);
data=reshape(data,row*col,1);
decoded_data=DEC(data);
end