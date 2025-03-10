source('3_visualize/src/drought_learner_viz_components.R')

p3_targets <- list(
       
  
  # Global design variables to be used in each frame, with "dv_" as prefix for "design variable"
  tar_target(p3_dv_tibble,
             tibble(
               # Drought events
               dv_drought_fill_variable = "#F7931E",
               dv_drought_fill_fixed = "#FFCC00",
               dv_drought_threshold_variable = "#FCC065",
               dv_drought_threshold_fixed = "#fcee21",
               dv_drought_textColor = "#fef8a6",
               dv_threshold_line_size = 0.5, #default = 0.5
               df_fill_outline = "white",
               dv_fill_outline_size = 0.05, #0.05
               # Streamflow
               dv_streamflow_line_daily = "#A2D7DE",
               dv_streamflow_line_annual_average = "#DDEFF2",
               dv_streamflow_line_daily_average = "#DDEFF2",
               dv_streamflow_textcolor_daily = "#A2D7DE",
               dv_streamflow_textcolor_annual_average = "#DDEFF2",
               dv_streamflow_textcolor_daily_average = "#DDEFF2",
               dv_streamflow_line_size = 0.3, #default = 0.5
               # Other Annotations
               dv_circle_explainer = "#fcee21",
               dv_shading_fill = "#FFEECE", # should match the css .hydro-chart background-color
               dv_zoom_box_outline = "black",
               dv_zoom_box_lines = "black",
               dv_axis_additions_stackedYear = "#666666",
               # png sizing,
               dv_png_width = 1200, 
               dv_png_height = 800,
               # Base plot design
               dv_basePlot_axis_color = "#DDEFF2",
               dv_basePlot_axis_size = 0.1,
               dv_basePlot_axis_text_color = "#DDEFF2"
             )
  ),
  
  
  
  #### Creates a series of ggplot pngs that will get pulled together downstream
  #
  # NOTE: Must make sure that target 'p2_1951_2020_metadata_subset' includes the correct data
  #

    # This is for most frames, focused on growing season
  tar_target(p3_blank_plot_summer,
             blank_plot(streamflow_df = p2_streamflow_learner_viz_df,
                        dv_tibble = p3_dv_tibble,
                        growing_season = T)),
  
    # This is for the frames showing a whole year
  tar_target(p3_blank_plot_year,
             blank_plot(streamflow_df = p2_streamflow_learner_viz_df,
                        dv_tibble = p3_dv_tibble,
                        growing_season = F)),
  
  tar_target(p3_inset_map,
             inset_map(state_fill = "#1e466e",
                       border_size = 0.1,
                       border_fill = "#ddeff2",
                       highlight_site_color = "#fcee21")),

    # Bottom bars are specified in four ways:
      # extent = "fixed one" when only the August fixed threshold drought should show; growing season time frame
      # extent = "fixed all" when all the fixed threshold droughts can show; growing season time frame
      # extent = "both" when all the droughts can show; growing season time frame
      # extent = "both year" when all the droughts can show; full year time frame
  tar_target(p3_bottom_bars_fixed_one,
             bottom_bars(extent = "fixed one", 
                         droughts_df = p2_droughts_learner_viz_df, 
                         blank_plot = p3_blank_plot_summer,
                         dv_tibble = p3_dv_tibble)),
  tar_target(p3_bottom_bars_fixed_all,
             bottom_bars(extent = "fixed all", 
                         droughts_df = p2_droughts_learner_viz_df, 
                         blank_plot = p3_blank_plot_summer,
                         dv_tibble = p3_dv_tibble)),
  tar_target(p3_bottom_bars_both,
             bottom_bars(extent = "both", 
                         droughts_df = p2_droughts_learner_viz_df, 
                         blank_plot = p3_blank_plot_summer,
                         dv_tibble = p3_dv_tibble)),
  tar_target(p3_bottom_bars_both_year,
             bottom_bars(extent = "both year", 
                         droughts_df = p2_droughts_learner_viz_df, 
                         blank_plot = p3_blank_plot_summer,
                         dv_tibble = p3_dv_tibble)),
  
  
  # Frames 
  tar_target(p3_drought_learner_viz_a_png,
             frame_a(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_one,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/a.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_b_png,
             frame_b(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_one,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/b.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_c_png,
             frame_c(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_one,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/c.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_d_png,
             frame_d(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_one,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/d.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_e_png,
             frame_e(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_one,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/e.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_f_png,
             frame_f(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_all,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/f.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_g_png,
             frame_g(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_all,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/g.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_h_png,
             frame_h(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_all,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/h.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_i_png,
             frame_i(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_fixed_all,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/i.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_j_png,
             frame_j(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_both,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/j.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_k_png,
             frame_k(blank_plot = p3_blank_plot_summer,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_both,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/k.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_l_png,
             frame_l(blank_plot = p3_blank_plot_year,
                     streamflow_df = p2_streamflow_learner_viz_df,
                     droughts_df = p2_droughts_learner_viz_df,
                     bottom_bars = p3_bottom_bars_both_year,
                     inset = p3_inset_map,
                     canvas = p3_canvas,
                     out_png = "src/assets/images/threshold-chart/l.png",
                     dv_tibble = p3_dv_tibble),
             format = "file"),
  
  tar_target(p3_drought_learner_viz_m_png,
             frame_m(blank_plot = p3_blank_plot_year,
                     streamflow_df = p2_streamflow_learner_viz_df, 
                     droughts_df = p2_droughts_learner_viz_df,
                     droughts_70yr_site_df = p2_droughts_70year_stacked_site_df, 
                     droughts_70yr_j7_df = p2_droughts_70year_stacked_j7_df, 
                     bottom_bars = p3_bottom_bars_both_year,
                     canvas = p3_canvas, 
                     out_png = "src/assets/images/threshold-chart/m.png",
                     dv_tibble = p3_dv_tibble),
             format = "file")
)

