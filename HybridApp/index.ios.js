import React, { Component } from 'react';
import {
    AppRegistry,
    NavigatorIOS,
    Text,
    TouchableHighlight,
    TouchableOpacity,
    View,
    StyleSheet,
    NativeEventEmitter,
    NativeModules,
    Image,
} from 'react-native';
const { BWReactNativeBridge } = NativeModules

const managerEmitter = new NativeEventEmitter(BWReactNativeBridge)
// Don't forget to unsubscribe, typically in componentWillUnmount
// subscription.remove();

export default class AwesomeProject extends Component {
  render() {
    return (
      <NavigatorIOS
        initialRoute={{
          component: MyScene,
          title: 'React Native',
          }}
        style={{flex: 1}}
      />
    );
  }
}

class MyScene extends Component {
  render() {
    return (
      <View style={styles.container}>
      <TouchableOpacity style={styles.dismissView} onPress={this._onPressButton.bind(this)}>
        <Text>Dismiss React Native</Text>
      </TouchableOpacity>
      <Image source={require('./images/icon_card.png')} />
      <Text style={styles.verticalMargin}>{this.state.fromNativeText}</Text>
      </View>
    );
  }

  constructor() {
    super()
    this.state = {
      fromNativeText: 'Current Is React Native Text'
    }

    const subscription = managerEmitter.addListener(
      'BWReactNativeBridgePassParamsEvent',
      (reminder) => {
        console.log(reminder)
        console.log(reminder.text)
        console.log(this)
        this.setState = {fromNativeText: reminder.text}
      }
    );
  }

  _onPressButton() {
    // 调用原生模块，方法名和原生的模块参数名一直，如果需要传参，则参数顺序与原生的参数顺序保持一致
    var vc = NativeModules.BWPresentedRNViewController
    vc.dismissReactNativeVC()
  }
}

AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);

var styles = StyleSheet.create({
  container: {
    // flex: 1,  // 垂直方向撑满屏幕
    marginTop: 64,
    // flexDirection: 'row',
    backgroundColor: 'white',
    alignItems: 'center',
    justifyContent: 'center',
  },
  dismissView: {
    marginTop: 20,
    flexDirection: 'row',
    height: 40,
    backgroundColor: 'white',
  },
  iconImage: {
    marginTop: 20,
  },
  verticalMargin: {
    marginTop: 20,
  },
});
