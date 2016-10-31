
figure; 
subplot(221); imagesc(fliplr(C_raw),[params_plot.min_I,params_plot.max_I]);
set(gca,'xtick',[],'ytick',[]);
axis image; colorbar; title('Raw intensity'); 
subplot(222); imagesc(fliplr(C_hat_filt),[params_plot.min_I,params_plot.max_I]); 
set(gca,'xtick',[],'ytick',[]);
axis image; colorbar; title('Our intensity'); 
subplot(223); imagesc(fliplr(LT_raw),[params_plot.min_L,params_plot.max_L]); 
set(gca,'xtick',[],'ytick',[]);
axis image; colorbar; title('Raw lifetime (in ns)'); 
subplot(224); imagesc(fliplr(LT_hat_filt),[params_plot.min_L,params_plot.max_L]); 
set(gca,'xtick',[],'ytick',[]);
axis image; colorbar; title('Our lifetime (in ns)'); 

colormap(params_plot.cmp);
