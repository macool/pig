var CommentList = React.createClass({
  render: function() {
    if (this.props.comments.length > 0)
      var commentNodes = this.props.comments.map(function(comment) {
        return (
          <Comment author={comment.user} createdAt={comment.pretty_time} formattedCreatedAt={comment.formatted_created_at} key={comment.id}>
            {comment.comment}
          </Comment>
        );
      });
    else {
      return (
        <h4 className="text-center">No comments yet!</h4>
      );
    }

    return (
      <div className="comment-list" id="comment-list">
        {commentNodes}
      </div>
    );
  }
});
