//4x2 Priority Encoder using 2x1 priority encoder

module pencoder_4x2(
    input wire [3:0]i,
    output wire [1:0]o,
    output wire valid
    );
    wire [6:0]w;
    not (w[4],i[2]);                          //w[4] is compliment of i[2]                     
    and (w[5],w[4],i[1]);                     //w[5] is product of ~i[2] and i[1]              
    pencoder_2x1 d1(i[3:2],w[0],w[1]);        //w[0] and w[1] are out and valid of p_encoder-1 
    pencoder_2x1 d2(i[1:0],w[2],w[3]);        //w[2] and w[3] are out and valid of p_encoder-2 
    pencoder_2x1 d3({w[1],w[3]},o[1],valid);    
    pencoder_2x1 d4({w[5],i[3]},w[6],o[0]);     //w[6] is the out of p_encoder-4
endmodule