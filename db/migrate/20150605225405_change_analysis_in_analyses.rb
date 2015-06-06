class ChangeAnalysisInAnalyses < ActiveRecord::Migration
  enable_extension 'hstore' unless extension_enabled?('hstore')
  
  def change
    change_column :analyses, :analysis, 'hstore USING CAST(analysis AS hstore)'
  end
end
