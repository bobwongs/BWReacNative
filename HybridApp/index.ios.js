import React, { Component } from 'react';
import {
    AppRegistry,
    NavigatorIOS,
    Text,
    TouchableHighlight,
    TouchableOpacity,
    View,
    StyleSheet,
    NativeModules,
    NativeEventEmitter,
} from 'react-native';
const { CalendarManager } = NativeModules;

const calendarManagerEmitter = new NativeEventEmitter(CalendarManager);

const subscription = calendarManagerEmitter.addListener(
  'EventReminder',
  (reminder) => console.log(reminder.name)
);

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
      <TouchableOpacity style={styles.dismissView} onPress={this._onPressButton.bind(this)}>
        <Text>Dismiss React Native</Text>
      </TouchableOpacity>
    );
  }

  _onPressButton() {
    // 调用原生模块，方法名和原生的模块参数名一直，如果需要传参，则参数顺序与原生的参数顺序保持一致
    var vc = NativeModules.ViewController
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
  },
  dismissView: {
    marginTop: 64 + 20,
    flexDirection: 'row',
    height: 40,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'white',
  },
});
