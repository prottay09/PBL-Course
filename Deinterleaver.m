function deintrlv_data=Deinterleaver(data,Modulation_order,Frame_length,code_rate)
    [row,col]=size(data);
    deintrlv_data=zeros(row*col,1);
    data=reshape(data,row*col,1);
    depth=log2(Modulation_order);
    Num_of_blocks=Frame_length/(depth*code_rate);
    Num_of_symbols=length(data)/(Num_of_blocks*depth);
    if rem(floor(sqrt(Num_of_symbols)),2)==0
        w=floor(sqrt(Num_of_symbols));
    else
        w=floor(sqrt(Num_of_symbols))+1;
    end
    l=floor(Num_of_symbols/w);
    for i=1:Num_of_blocks
        x=reshape(data(((i-1)*Num_of_symbols*depth)+1:(i*Num_of_symbols*depth)),w*l,depth);
        deintdata=helscandeintrlv(x,l,w,1);
        deintrlv_data(((i-1)*Num_of_symbols*depth)+1:(i*Num_of_symbols*depth))=reshape(deintdata,Num_of_symbols*depth,1);
    end
end
