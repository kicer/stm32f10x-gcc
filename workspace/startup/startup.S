#if defined(STM32F10X_LD)
 #include "startup_stm32f10x_ld.s"
#elif defined(STM32F10X_LD_VL)
 #include "startup_stm32f10x_ld_vl.s"
#elif defined(STM32F10X_MD)
 #include "startup_stm32f10x_md.s"
#elif defined(STM32F10X_MD_VL)
 #include "startup_stm32f10x_md_vl.s"
#elif defined(STM32F10X_HD)
 #include "startup_stm32f10x_hd.s"
#elif defined(STM32F10X_HD_VL)
 #include "startup_stm32f10x_hd_vl.s"
#elif defined(STM32F10X_XL)
 #include "startup_stm32f10x_xl.s"
#elif defined(STM32F10X_CL)
 #include "startup_stm32f10x_cl.s"
#else
 #error "Please select first the target STM32F10x device used in your application"
#endif
