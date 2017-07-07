import React, { Component, PropTypes } from 'react';
import {
    AppRegistry,
    NavigatorIOS,
    Text,
    TouchableHighlight,
    View,
    ListView,
    StyleSheet
} from 'react-native';

export default class AwesomeProject extends Component {
  render() {
    return (
      <NavigatorIOS
        initialRoute={{
          component: MyScene,
          title: 'Home',
          rightButtonTitle: 'Add',
          onRightButtonPress: () => this._rightButtonAction(),
          }}
        style={{flex: 1}}
      />
    );
  }

  _rightButtonAction() {
    // const nextRoute = {
    //   component: MyScene,
    //   title: 'Next Scene',
    //   passProps: { myProp: 'bar' }
    // };
    this.props.navigator.push({
      component: MyScene,
      title: 'Next Scene',
      passProps: { myProp: 'bar' }
    });
  }
}

class MyScene extends Component {
  render() {
    return (
      <View style={styles.container}>
        <TouchableHighlight onPress={this._handleNextPress}>
          <Text style={styles.my_text}>Hello</Text>
        </TouchableHighlight>
      </View>
    )
  }
  
  static propTypes = {
    title: PropTypes.string.isRequired,
    navigator: PropTypes.object.isRequired,
  }

  constructor(props, context) {
    super(props, context);
    this._onForward = this._onForward.bind(this);
//    this._onBack = this._onBack.bind(this);

    var ds = new ListView.DataSource({rowHasChanged: (r1, r2) => r1 !== r2});
    this.state = {
      dataSource: ds.cloneWithRows(['row 1', 'row 2']),
    };
  }

  _onForward() {
    this.props.navigator.push({
      title: 'Scene ' + nextIndex,
    });
  }

  _handleBackPress() {
    this.props.navigator.pop();
  }

  // 待研究，如何在MyScene这个类中调到AwesomeProject.navigator
  _handleNextPress() {
    const nextRoute = {
      component: MyScene,
      title: 'Next Scene',
      passProps: { myProp: 'bar' }
    };
    this.props.navigator.push(nextRoute);
}

  _pressAction() {
    console.log('press action')
  }

}

AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);

var styles = StyleSheet.create({
  container: {
    // backgroundColor: '#00ff00',

    alignItems: 'center',  // 让子元素“水平”居中对齐
    justifyContent: 'center',  // 让子元素“垂直”居中对齐
    flex: 1,  // 垂直方向撑满屏幕
  },
  my_text: {
    width: 100,
    backgroundColor: 'orange',
    fontSize: 20,
    fontWeight:'bold',
    textAlign: 'center',
  },
});