var CommentForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    var text = ReactDOM.findDOMNode(this.refs.comment).value.trim();
    if (!text) {
      return;
    }
    this.props.onCommentSubmit({comment: text});
    ReactDOM.findDOMNode(this.refs.comment).value = '';
    return;
  },
  render: function() {
    return (
      <div>
        <textarea id="comment_text" className="js-skip-dirty" type="text" placeholder="Say something..." ref="comment" />
        <button id="comment_button" className="btn btn-primary pull-right" onClick={this.handleSubmit} >Comment</button>
        <div className="clearfix"></div>
      </div>
    );
  }
});
