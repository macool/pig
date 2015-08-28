var CommentBox = React.createClass({
  getInitialState: function() {
    return {comments: this.props.comments};
  },
  scrollToBottom: function() {
    var objDiv = document.getElementById("comment-list");
    objDiv.scrollTop = objDiv.scrollHeight;

  },
  componentDidMount: function() {
    if(this.props.comments.length > 0) {
      this.scrollToBottom();
    }
  },
  handleCommentSubmit: function(comment, commentInput) {
    var comments = this.state.comments;
    comment.user = {full_name:  this.props.author };
    var newComments = comments.concat([comment]);
    this.setState({comments: newComments}, function() {
      this.scrollToBottom();
    });
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: {'comments': comment},
      success: function(data) {
        this.setState({comments: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return (
      <div id="cms-comments">
        <CommentList comments={this.state.comments} />
        <CommentForm onCommentSubmit={this.handleCommentSubmit}/>
      </div>
    );
  }
});
