package cn.com.yto56.cockpit.entity.dto.${entity.model};

import cn.com.yto56.cockpit.entity.dto.cognos.CascaderSelection;
import cn.com.yto56.cockpit.entity.page.BasePageRequest;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.List;

@Data
@NoArgsConstructor
public class ${entity.model}Request extends BasePageRequest {

    private String dateType;

    private String sumStartDate;

    private String sumEndDate;

    private String detStartDate;

    private String detEndDate;

    private CascaderSelection queryOrgCode;

    private String orgCode;

    private List<${entity.string}> regionCode;

    private List<${entity.string}> transferCode;

    private List<${entity.string}> branchCode;

    private List<${entity.string}> subDepartmentCode;

    private String queryType;

    private String userOrgCode;

    private String userOrgType;

    private String sortColum;

    private String sortOrder;

}