module ItemsHelper
    def sc_c_date(item)
        t =item.created_at
        "#{t.year}年#{t.month}月#{t.day}日"
    end

    def sc_u_date(item)
        t =item.updated_at
        "#{t.year}年#{t.month}月#{t.day}日"
    end

    def curr_day_status(item)
        if(item.status == '新报修' && (item.created_at + 1.day  < Time.now))
            item.update_attribute(:status,'维修中')
        end
        item.status
    end

    def curr_status_color(item)
        case(item.status)
        when '新报修'
            '#0AA'
        when '无法修复'
            '#A30'
        when '维修中'
             '#0A4'
        when '已修好'
             '#03B'
        else
            '#111'
        end
    end

end
