plot_C_raw = (C_raw); 
plot_C_hat_filt = (C_hat_filt);
plot_LT_raw = (LT_raw);
plot_LT_hat_filt = (LT_hat_filt);

figure; 
subplot(221); imagesc(plot_C_raw,[params_plot.min_I,params_plot.max_I]);
set(gca,'xtick',[],'ytick',[]);
axis image; colorbar; title('Raw intensity'); 
subplot(222); imagesc(plot_C_hat_filt,[params_plot.min_I,params_plot.max_I]); 
set(gca,'xtick',[],'ytick',[]);
axis image; colorbar; title('Our intensity'); 
subplot(223); imagesc(plot_LT_raw,[params_plot.min_L,params_plot.max_L]); 
set(gca,'xtick',[],'ytick',[]);
axis image; colorbar; title('Raw lifetime (in ns)'); 
subplot(224); imagesc(plot_LT_hat_filt,[params_plot.min_L,params_plot.max_L]); 
set(gca,'xtick',[],'ytick',[]);
axis image; colorbar; title('Our lifetime (in ns)'); 

colormap(params_plot.cmp);
