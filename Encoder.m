function encoded_data=Encoder(data,code_rate)
trel=poly2trellis([7],[133,171]);
if code_rate==1/2
    hConvEnc = comm.ConvolutionalEncoder(trel,...
                'TerminationMethod','Continuous');
elseif code_rate==2/3
    hConvEnc = comm.ConvolutionalEncoder(trel,...
                'TerminationMethod','Continuous',...
                'PuncturePatternSource','Property',...
                'PuncturePattern',[1; 1; 1; 0;]);
else
    disp("code rate is not supported")
end
[row,col]=size(data);
data=reshape(data,row*col,1);
encoded_data=hConvEnc(data);
end
