# encoding: UTF-8
ActiveAdmin::Dashboards.build do


  %w(matrice substance technique).each do |name|
    klass = name.classify.constantize
    section "#{name.titleize.pluralize}" do
      ul do
        klass.limit(5).collect do |instance|
          li link_to(instance.name, edit_polymorphic_path([:administration, instance]))
        end
      end
      strong { link_to "Voir la liste complète", polymorphic_path([:administration, klass])}
    end
  end

  #section "Matrices crées récemment" do
    #ul do
      #Matrice.limit(5).collect do |matrice|
        #li link_to(matrice.name, edit_administration_matrice_path(matrice))
      #end
    #end
    #strong { link_to "Voir la liste complète", administration_matrices_path}
  #end

  #section "Techniques crées récemment" do
    #ul do
      #Technique.limit(5).collect do |technique|
        #li link_to(technique.name, edit_administration_technique_path(technique))
      #end
    #end
  #end

  #section "Substances crées récemment" do
    #ul do
      #Substance.limit(5).collect do |substance|
        #li link_to(substance.name, edit_administration_substance_path(substance))
      #end
    #end
  #end

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
