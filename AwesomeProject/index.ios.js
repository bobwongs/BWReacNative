import React, { Component, PropTypes } from 'react';
import {
    AppRegistry,
    NavigatorIOS,
    Text,
    TouchableHighlight,
    View,
    FlatList,
    StyleSheet,
    TextInput,
} from 'react-native';

export default class AwesomeProject extends Component {
  render() {
    return (
      <NavigatorIOS
        initialRoute={{
          component: MyScene,
          title: 'Home',
          }}
        style={{flex: 1}}
      />
    );
  }
}

var listData = ['one', 'two', 'three'];

class MyScene extends Component {
  _onPressButton() {
    console.log('press');
  }

  _deleteAction() {
    console.log('delete');
  }

  _renderItem = ({item}) => (
    <View>
      <Text style={styles.itemStyle}>{item}</Text>
      <TouchableHighlight onPress={this._deleteAction}>
        <Text style={styles.deleteBtn}>Delete</Text>
      </TouchableHighlight>
    </View>
  );

  render() {
    return (
      <View style={styles.container}>
        <TextInput 
        style={styles.textInputStyle} 
        placeholder='Please input here!' 
        />
        <TouchableHighlight onPress={this._onPressButton}>
          <Text style={styles.addBtn}>Add</Text>
        </TouchableHighlight>
        <FlatList 
          data={listData}
          renderItem = {this._renderItem}
        />
      </View>
    )
  }
}

AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);

var styles = StyleSheet.create({
  container: {
    flex: 1,  // 垂直方向撑满屏幕
    marginTop: 64,
    // flexDirection: 'row',
  },
  textInputStyle: {
    height: 40, 
    backgroundColor: '#ffff45',
    // position: 'inherit',
  },
  addBtn: {
    width: 80,
    height: 40,
    backgroundColor: 'blue',
  },
  itemStyle: {
    padding: 10,
    fontSize: 18,
    height: 44,
  },
  deleteBtn: {
    width: 50,
    height: 44,
    backgroundColor: 'red'
  },
});


// container: {
//     // backgroundColor: '#00ff00',

//     alignItems: 'center',  // 让子元素“水平”居中对齐
//     justifyContent: 'center',  // 让子元素“垂直”居中对齐
//     flex: 1,  // 垂直方向撑满屏幕
//   },
//   my_text: {
//     width: 100,
//     backgroundColor: 'orange',
//     fontSize: 20,
//     fontWeight:'bold',
//     textAlign: 'center',
//   },