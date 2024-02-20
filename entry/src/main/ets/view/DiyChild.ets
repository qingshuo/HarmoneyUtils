@Component
export default struct DiyChild {
  @State title: string = 'DiyChild';

  aboutToDisappear(){
    console.info('[DiyChild] DiyChild aboutToDisappear');
  }

  aboutToAppear(){
    console.info('[DiyChild] DiyChild aboutToAppear')
  }

  build(){
    Text(this.title).fontSize(50).onClick(() => {
      this.title = 'Hello onClick';
    })
  }

}