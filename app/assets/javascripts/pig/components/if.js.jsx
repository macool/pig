var If = createReactClass({
  render: function() {
    if (this.props.test) {
      return this.props.children;
    }
    else {
      return false;
    }
  }
});
