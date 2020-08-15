var DeactivateUserButton = createReactClass({
  render: function() {
    return <span>
        <a className='btn btn-xs set-active-btn btn-default' onClick={this.showPackageReassigner}>
          Deactivate
        </a>
        <PackageReassigner userId={this.props.userId} deactivateUrl={this.props.deactivateUrl} contentUrl={this.props.contentUrl} users={this.props.users} ref='packageReassigner'/>
      </span>;
  },
  showPackageReassigner: function() {
    this.refs.packageReassigner.show();
  }
});
