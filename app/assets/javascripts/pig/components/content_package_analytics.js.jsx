var ContentPackageAnalytics = React.createClass({
  getInitialState: function() {
   return {
     isLoading: true,
     pageViewCount: ''
   };
 },
 componentDidMount: function() {
    $.get(this.props.analyticsPath, function(result) {
      if (this.isMounted()) {
        this.setState({
          isLoading: false,
          pageViewsCount: result.pageViewsCount
        });
      }
    }.bind(this));
  },
  render: function() {
    if (this.state.isLoading) {
      content = (
        <div className={this.state.isLoading ? '' : 'hide'}>
          <i className="fa fa-circle-o-notch fa-spin fa-2x"></i>
        </div>
      );
    }
    else {
      content = (
        <div>
          <label className="col-primary">Total page views</label>
          <p>{this.state.pageViewsCount}</p>
        </div>
      );
    }
    return (
      <div>
        {content}
      </div>
    );
  }
});
