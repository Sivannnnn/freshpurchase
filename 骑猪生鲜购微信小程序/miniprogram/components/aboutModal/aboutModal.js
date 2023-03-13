Component({
    properties: {
        
    },

    data: {      
    },
    methods: {
        showModal(info) {
            this.setData({
              modalName: 'Modal',
              modalInfo: info
            })
        },
        hideModal() {
          this.setData({
            modalName: null
          })
        },
    }
})
