// config.js
const config = {
    idCardSettings: {
        closeKey: 'Backspace',
        autoClose: {
            status: false, // or true
            time: 3000
        }
    },
    licenses: {
        'id_card': {
            header: 'Thẻ căn cước',
            background: '#ebf7fd',            
            backgroundImage: 'https://i.ibb.co/vxvGzg1/card.png',
            prop: 'prop_franklin_dl'
        },
        'driver_license': {
            header: 'Giấy phép lái xe',
            background: '#febbbb',
            backgroundImage: 'https://i.ibb.co/vxvGzg1/card.png',
            prop: 'prop_franklin_dl',
        },
        'weaponlicense': {
            header: 'Giấy phép vũ khí',
            background: '#c7ffe5',
            backgroundImage: 'https://i.ibb.co/vxvGzg1/card.png',
            prop: 'prop_franklin_dl',
        },
        'lawyerpass': {
            header: 'Thẻ Luật Sư',
            background: '#f9c491',
            backgroundImage: 'https://i.ibb.co/vxvGzg1/card.png',
            prop: 'prop_cs_r_business_card'
        }
    }
};

export default config;