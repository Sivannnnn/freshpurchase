Component({
    properties: {

    },
    data: {
        loadModal: false,
        loadingModalInfo: '',
    },
    methods: {
        showLoadModal(info){
            this.setData({ 
                loadModal:true,
                loadingModalInfo: info
            });
        },
        hiddenLoadModal(){
            this.setData({ loadModal:false });
        }
    }
})
