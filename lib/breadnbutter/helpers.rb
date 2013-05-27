module BreadnButter::Helpers
  # Include this module in any controller you want to use breadcrumbs
  def get_breadcrumbs
    # note controller.request.env instead of controller.env
    # so that it works in both development, staging, 
    # and in our controller specs which render views
    url = controller.request.env['PATH_INFO']
    BreadnButter::Crumb.generate_crumbs_from_url(url)
  end

  def render_breadcrumbs
    render :partial => 'breadnbutter/crumb', :locals => {:breadcrumbs => get_breadcrumbs}
  end
end

