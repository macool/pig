var Comment = createReactClass({
  render: function() {
    return (
      <div>
        <div>
          <img className="comment-profile" src={this.props.author.profile_picture_url} />
          <div className="comment-header">
            <h4 className="comment-author">
              { this.props.author.full_name }
            </h4>
            <div className="comment-time" title={this.props.formattedCreatedAt}>{this.props.createdAt} ago</div>
          </div>
        </div>
        <div className="comment-body">
          {this.props.children}
        </div>
        <hr/>
      </div>
    );
  }
});
