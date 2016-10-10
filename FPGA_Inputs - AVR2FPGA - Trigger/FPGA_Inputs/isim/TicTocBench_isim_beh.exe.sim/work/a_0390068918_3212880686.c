/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/HLi/FPGA_Inputs/TicToc.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;
extern char *WORK_P_3804285729;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_0390068918_3212880686_p_0(char *t0)
{
    char t19[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;
    char *t22;

LAB0:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3792);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(60, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1472U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 6076U);
    t4 = ((WORK_P_3804285729) + 1168U);
    t7 = *((char **)t4);
    t13 = *((int *)t7);
    t14 = (t13 - 2);
    t2 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t3, t1, t14);
    if (t2 != 0)
        goto LAB11;

LAB13:    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 6076U);
    t4 = ((WORK_P_3804285729) + 1168U);
    t7 = *((char **)t4);
    t13 = *((int *)t7);
    t14 = (t13 - 2);
    t2 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t3, t1, t14);
    if (t2 != 0)
        goto LAB34;

LAB35:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 3936);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB12:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(61, ng0);
    t3 = xsi_get_transient_memory(16U);
    memset(t3, 0, 16U);
    t7 = t3;
    memset(t7, (unsigned char)2, 16U);
    t8 = (t0 + 3872);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 3936);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB8:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 3936);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t3);
    goto LAB9;

LAB11:    xsi_set_current_line(69, ng0);
    t4 = (t0 + 2152U);
    t8 = *((char **)t4);
    t6 = *((unsigned char *)t8);
    t15 = (t6 == (unsigned char)2);
    if (t15 == 1)
        goto LAB17;

LAB18:    t5 = (unsigned char)0;

LAB19:    if (t5 != 0)
        goto LAB14;

LAB16:    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t5 = *((unsigned char *)t3);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB24;

LAB25:    t2 = (unsigned char)0;

LAB26:    if (t2 != 0)
        goto LAB22;

LAB23:    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t5 = *((unsigned char *)t3);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = (unsigned char)0;

LAB33:    if (t2 != 0)
        goto LAB29;

LAB30:
LAB15:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 4064);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t2;
    xsi_driver_first_trans_fast(t1);
    goto LAB12;

LAB14:    xsi_set_current_line(70, ng0);
    t4 = (t0 + 3936);
    t10 = (t4 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t18 = *((char **)t12);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(71, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t3 = t1;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 3872);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 6076U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t19, t3, t1, 1);
    t7 = (t19 + 12U);
    t20 = *((unsigned int *)t7);
    t21 = (1U * t20);
    t2 = (16U != t21);
    if (t2 == 1)
        goto LAB20;

LAB21:    t8 = (t0 + 4000);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t4, 16U);
    xsi_driver_first_trans_fast(t8);
    goto LAB15;

LAB17:    t4 = (t0 + 1352U);
    t9 = *((char **)t4);
    t16 = *((unsigned char *)t9);
    t17 = (t16 == (unsigned char)3);
    t5 = t17;
    goto LAB19;

LAB20:    xsi_size_not_matching(16U, t21, 0);
    goto LAB21;

LAB22:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1992U);
    t7 = *((char **)t1);
    t1 = (t0 + 6060U);
    t8 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t19, t7, t1, 1);
    t9 = (t19 + 12U);
    t20 = *((unsigned int *)t9);
    t21 = (1U * t20);
    t17 = (16U != t21);
    if (t17 == 1)
        goto LAB27;

LAB28:    t10 = (t0 + 3872);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t18 = (t12 + 56U);
    t22 = *((char **)t18);
    memcpy(t22, t8, 16U);
    xsi_driver_first_trans_fast(t10);
    goto LAB15;

LAB24:    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t15 = *((unsigned char *)t4);
    t16 = (t15 == (unsigned char)3);
    t2 = t16;
    goto LAB26;

LAB27:    xsi_size_not_matching(16U, t21, 0);
    goto LAB28;

LAB29:    goto LAB15;

LAB31:    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t15 = *((unsigned char *)t4);
    t16 = (t15 == (unsigned char)2);
    t2 = t16;
    goto LAB33;

LAB34:    xsi_set_current_line(85, ng0);
    t4 = (t0 + 2312U);
    t8 = *((char **)t4);
    t4 = (t0 + 4128);
    t9 = (t4 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t8, 16U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 3936);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB12;

}


extern void work_a_0390068918_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0390068918_3212880686_p_0};
	xsi_register_didat("work_a_0390068918_3212880686", "isim/TicTocBench_isim_beh.exe.sim/work/a_0390068918_3212880686.didat");
	xsi_register_executes(pe);
}
