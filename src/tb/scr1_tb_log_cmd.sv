module scr1_tb_log_cmd();

always_ff @(posedge scr1_top_tb_ahb.i_top.i_imem_ahb.clk)
begin
    if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp == 2'b01)
    begin
        if(
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[6 : 0] == 7'b0110011) 
            &
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[14 : 12] == 3'b101)
        )
        begin
            $display("\n\tDetected SRL comand");
            $display("\nfunct3 = %b\nrs2 = %b\nrs1 = %b\nimmidiate = %b\nopcode = %h\n",
            scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[14 : 12],
            scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[24 : 20],
            scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[19 : 15],
            scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[32 : 25],
            scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata);
        end 
    end
end

endmodule