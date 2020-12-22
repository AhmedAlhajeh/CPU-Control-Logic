# Copyright (C) 1991-2008 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.

# Quartus II Version 8.1 Build 163 10/28/2008 SJ Web Edition
# File: H:\home\kmcisaac\Courses\ECE 489b\Lab Projects\Quartus Project Files\toy489 basic\cpu_top_hw.tcl
# Generated on: Sun Oct 16 19:55:46 2011

package require ::quartus::project

set_location_assignment PIN_129 -to ALU_OP2
set_location_assignment PIN_129 -to ALU_OP[2]
set_location_assignment PIN_128 -to ALU_OP1
set_location_assignment PIN_128 -to ALU_OP[1]
set_location_assignment PIN_127 -to ALU_OP0
set_location_assignment PIN_127 -to ALU_OP[0]
set_location_assignment PIN_133 -to WR
set_location_assignment PIN_141 -to USER2
set_location_assignment PIN_141 -to USER[2]
set_location_assignment PIN_139 -to USER1
set_location_assignment PIN_139 -to USER[1]
set_location_assignment PIN_138 -to USER0
set_location_assignment PIN_138 -to USER[0]
set_location_assignment PIN_120 -to SEL_D2
set_location_assignment PIN_120 -to SEL_D[2]
set_location_assignment PIN_119 -to SEL_D1
set_location_assignment PIN_119 -to SEL_D[1]
set_location_assignment PIN_118 -to SEL_D0
set_location_assignment PIN_118 -to SEL_D[0]
set_location_assignment PIN_116 -to SEL_B2
set_location_assignment PIN_116 -to SEL_B[2]
set_location_assignment PIN_115 -to SEL_B1
set_location_assignment PIN_115 -to SEL_B[1]
set_location_assignment PIN_114 -to SEL_B0
set_location_assignment PIN_114 -to SEL_B[0]
set_location_assignment PIN_111 -to SEL_A2
set_location_assignment PIN_111 -to SEL_A[2]
set_location_assignment PIN_110 -to SEL_A1
set_location_assignment PIN_110 -to SEL_A[1]
set_location_assignment PIN_109 -to SEL_A0
set_location_assignment PIN_109 -to SEL_A[0]
set_location_assignment PIN_132 -to RD
set_location_assignment PIN_196 -to PC15
set_location_assignment PIN_196 -to PC[15]
set_location_assignment PIN_195 -to PC14
set_location_assignment PIN_195 -to PC[14]
set_location_assignment PIN_194 -to PC13
set_location_assignment PIN_194 -to PC[13]
set_location_assignment PIN_193 -to PC12
set_location_assignment PIN_193 -to PC[12]
set_location_assignment PIN_192 -to PC11
set_location_assignment PIN_192 -to PC[11]
set_location_assignment PIN_191 -to PC10
set_location_assignment PIN_191 -to PC[10]
set_location_assignment PIN_190 -to PC9
set_location_assignment PIN_190 -to PC[9]
set_location_assignment PIN_188 -to PC8
set_location_assignment PIN_188 -to PC[8]
set_location_assignment PIN_187 -to PC7
set_location_assignment PIN_187 -to PC[7]
set_location_assignment PIN_186 -to PC6
set_location_assignment PIN_186 -to PC[6]
set_location_assignment PIN_185 -to PC5
set_location_assignment PIN_185 -to PC[5]
set_location_assignment PIN_184 -to PC4
set_location_assignment PIN_184 -to PC[4]
set_location_assignment PIN_183 -to PC3
set_location_assignment PIN_183 -to PC[3]
set_location_assignment PIN_182 -to PC2
set_location_assignment PIN_182 -to PC[2]
set_location_assignment PIN_181 -to PC1
set_location_assignment PIN_181 -to PC[1]
set_location_assignment PIN_175 -to PC0
set_location_assignment PIN_175 -to PC[0]
set_location_assignment PIN_134 -to OE_PC
set_location_assignment PIN_117 -to OEB
set_location_assignment PIN_113 -to OEA
set_location_assignment PIN_136 -to LOAD_PC
set_location_assignment PIN_131 -to LOAD_MAR
set_location_assignment PIN_137 -to LOAD_IR
set_location_assignment PIN_126 -to LOAD_D
set_location_assignment PIN_220 -to IR15
set_location_assignment PIN_220 -to IR[15]
set_location_assignment PIN_219 -to IR14
set_location_assignment PIN_219 -to IR[14]
set_location_assignment PIN_218 -to IR13
set_location_assignment PIN_218 -to IR[13]
set_location_assignment PIN_217 -to IR12
set_location_assignment PIN_217 -to IR[12]
set_location_assignment PIN_215 -to IR11
set_location_assignment PIN_215 -to IR[11]
set_location_assignment PIN_214 -to IR10
set_location_assignment PIN_214 -to IR[10]
set_location_assignment PIN_208 -to IR9
set_location_assignment PIN_208 -to IR[9]
set_location_assignment PIN_207 -to IR8
set_location_assignment PIN_207 -to IR[8]
set_location_assignment PIN_206 -to IR7
set_location_assignment PIN_206 -to IR[7]
set_location_assignment PIN_204 -to IR6
set_location_assignment PIN_204 -to IR[6]
set_location_assignment PIN_203 -to IR5
set_location_assignment PIN_203 -to IR[5]
set_location_assignment PIN_202 -to IR4
set_location_assignment PIN_202 -to IR[4]
set_location_assignment PIN_201 -to IR3
set_location_assignment PIN_201 -to IR[3]
set_location_assignment PIN_200 -to IR2
set_location_assignment PIN_200 -to IR[2]
set_location_assignment PIN_199 -to IR1
set_location_assignment PIN_199 -to IR[1]
set_location_assignment PIN_198 -to IR0
set_location_assignment PIN_198 -to IR[0]
set_location_assignment PIN_75 -to D15
set_location_assignment PIN_75 -to D[15]
set_location_assignment PIN_74 -to D14
set_location_assignment PIN_74 -to D[14]
set_location_assignment PIN_73 -to D13
set_location_assignment PIN_73 -to D[13]
set_location_assignment PIN_72 -to D12
set_location_assignment PIN_72 -to D[12]
set_location_assignment PIN_71 -to D11
set_location_assignment PIN_71 -to D[11]
set_location_assignment PIN_70 -to D10
set_location_assignment PIN_70 -to D[10]
set_location_assignment PIN_68 -to D9
set_location_assignment PIN_68 -to D[9]
set_location_assignment PIN_67 -to D8
set_location_assignment PIN_67 -to D[8]
set_location_assignment PIN_84 -to D7
set_location_assignment PIN_84 -to D[7]
set_location_assignment PIN_83 -to D6
set_location_assignment PIN_83 -to D[6]
set_location_assignment PIN_82 -to D5
set_location_assignment PIN_82 -to D[5]
set_location_assignment PIN_81 -to D4
set_location_assignment PIN_81 -to D[4]
set_location_assignment PIN_80 -to D3
set_location_assignment PIN_80 -to D[3]
set_location_assignment PIN_79 -to D2
set_location_assignment PIN_79 -to D[2]
set_location_assignment PIN_78 -to D1
set_location_assignment PIN_78 -to D[1]
set_location_assignment PIN_76 -to D0
set_location_assignment PIN_76 -to D[0]
set_location_assignment PIN_41 -to FREERUN
set_location_assignment PIN_29 -to RESET
set_location_assignment PIN_28 -to ONE_SHOT
set_location_assignment PIN_88 -to AWRH
set_location_assignment PIN_87 -to AWRL
set_location_assignment PIN_86 -to ARD
set_location_assignment PIN_66 -to A15
set_location_assignment PIN_66 -to A[15]
set_location_assignment PIN_65 -to A14
set_location_assignment PIN_65 -to A[14]
set_location_assignment PIN_64 -to A13
set_location_assignment PIN_64 -to A[13]
set_location_assignment PIN_63 -to A12
set_location_assignment PIN_63 -to A[12]
set_location_assignment PIN_62 -to A11
set_location_assignment PIN_62 -to A[11]
set_location_assignment PIN_61 -to A10
set_location_assignment PIN_61 -to A[10]
set_location_assignment PIN_56 -to A9
set_location_assignment PIN_56 -to A[9]
set_location_assignment PIN_55 -to A8
set_location_assignment PIN_55 -to A[8]
set_location_assignment PIN_54 -to A7
set_location_assignment PIN_54 -to A[7]
set_location_assignment PIN_53 -to A6
set_location_assignment PIN_53 -to A[6]
set_location_assignment PIN_51 -to A5
set_location_assignment PIN_51 -to A[5]
set_location_assignment PIN_50 -to A4
set_location_assignment PIN_50 -to A[4]
set_location_assignment PIN_49 -to A3
set_location_assignment PIN_49 -to A[3]
set_location_assignment PIN_48 -to A2
set_location_assignment PIN_48 -to A[2]
set_location_assignment PIN_46 -to A1
set_location_assignment PIN_46 -to A[1]
set_location_assignment PIN_45 -to A0
set_location_assignment PIN_45 -to A[0]
set_location_assignment PIN_91 -to FCLK
