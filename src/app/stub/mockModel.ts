import { IContact } from "../api-interfaces";

export class MockModel {

  constructor(public data?: IContact) {}

  save() {
    return this.data;
  }

  getApiHome() {
    return { message: 'Welcome to api!'}
  }

  static findOne({ _id }) {
      return _id;
  }
}