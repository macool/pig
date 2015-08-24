# # encoding: utf-8
Pig.setup   do |config|
  # Should the permalinks of content packages be nested based on there position in the Content list
    # For example:                                                            
            # Parent Page (/parent)                                                                                                                                                                      
            #   |                                                          
            #   +--+Child Page (/parent/child)                                                                                                   
            #   |                                                          
            #   +--+Another Child page (/parent/another-child)                                   
            #      |                                                     
            #      +-->Grandchild page (/parent/another-child/grandchild                                
    config.nested_permalinks = true
    config.tags_feature = true
    config.basic_redactor_plugins = ['linksSameTabOnly']
    config.redactor_plugins = ['video', 'table', 'callOuts', 'highlightBlocks', 'expandContent', 'blockQuote', 'dateBlock', 'storify', 'linksSameTabOnly']

    # config.on_unpublished do
    #   redirect_to sign_in_path
    # end
end
